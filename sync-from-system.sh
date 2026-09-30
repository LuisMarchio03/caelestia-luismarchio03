#!/usr/bin/env bash
#
# sync-from-system.sh — puxa as configs da maquina para DENTRO deste repo.
#
# Sentido unico: ~/.config  ---->  repo.  Nada no sistema e alterado, nada
# passa a apontar para ca. Rode depois de mexer nas configs para o repo
# acompanhar, confira o `git diff` e commite.
#
# A lista de EXCLUDE abaixo e o que segura dado sensivel fora do repo publico.
# Se voce criar uma funcao fish nova com segredo, adicione ela aqui ANTES de
# rodar isto.
#
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CAELESTIA_SHARE="$HOME/.local/share/caelestia"

log()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m==>\033[0m %s\n' "$*"; }
die()  { printf '\033[1;31m==>\033[0m %s\n' "$*" >&2; exit 1; }

# Funcoes fish e configs que NUNCA entram no repo publico.
EXCLUDE_FISH=(
    delphi-vm          # acesso a VM interna, IP de rede privada
    vm-homolog         # idem

    # Wrappers do hangar: expoem a arquitetura de uma ferramenta privada e nao
    # funcionam fora desta maquina (dependem dos binarios hangar-*).
    claude
    claude-conta
    claude-engine
    codex
    kimi
    omp
    pi
)
EXCLUDE_CONFD=(
    gitlab-nuget       # token de registry em texto puro
)

# Trechos de config que sao removidos na hora de entrar no repo.
# Formato: um bloco por linha, com \n literal onde houver quebra.
strip_private_blocks() {
    # bind para o warpzone (app proprio, nao existe na maquina de ninguem)
    sed -e '/^# Warpzone/,+1d'
}

# Caminhos pessoais -> forma generica. Rode em TODO arquivo que entra.
sanitize() {
    sed -e "s|$HOME/Music/lyrics/|~/Music/lyrics/|g" \
        -e "s|\"$HOME/Pictures/Wallpapers\"|\"~/Pictures/Wallpapers\"|g" \
        -e "s|$HOME|\$HOME|g"
}

is_excluded() {
    local needle="$1"; shift
    local item
    for item in "$@"; do [[ "$item" == "$needle" ]] && return 0; done
    return 1
}

# ------------------------------------------------------------------ caelestia
log "caelestia"
# shell.json  = comportamento (barra, dashboard, lock, idle)
# shell-tokens.json = dimensoes (largura da barra, padding, rounding, fontes)
for f in shell.json shell-tokens.json; do
    [[ -f "$HOME/.config/caelestia/$f" ]] && \
        sanitize < "$HOME/.config/caelestia/$f" > "$REPO/config/caelestia/$f"
done
for f in hypr-user.conf hypr-blur.conf; do
    [[ -f "$HOME/.config/caelestia/$f" ]] && \
        sanitize < "$HOME/.config/caelestia/$f" | strip_private_blocks > "$REPO/config/caelestia/$f"
done

# ----------------------------------------------------------------------- fish
# As funcoes moram no clone do Caelestia porque ~/.config/fish e symlink para la.
log "fish"
FISH_SRC="$CAELESTIA_SHARE/fish"
[[ -d "$FISH_SRC" ]] || FISH_SRC="$HOME/.config/fish"

if [[ -d "$FISH_SRC" ]]; then
    sanitize < "$FISH_SRC/config.fish" > "$REPO/config/fish/config.fish"

    rm -f "$REPO/config/fish/functions/"*.fish
    for src in "$FISH_SRC/functions/"*.fish; do
        [[ -f "$src" ]] || continue
        name="$(basename "$src" .fish)"
        [[ "$src" == *.bak ]] && continue
        if is_excluded "$name" "${EXCLUDE_FISH[@]}"; then
            warn "pulando funcao excluida: $name"
            continue
        fi
        sanitize < "$src" > "$REPO/config/fish/functions/$name.fish"
    done

    rm -f "$REPO/config/fish/conf.d/"*.fish
    for src in "$FISH_SRC/conf.d/"*.fish; do
        [[ -f "$src" ]] || continue
        name="$(basename "$src" .fish)"
        if is_excluded "$name" "${EXCLUDE_CONFD[@]}"; then
            warn "pulando conf.d excluido: $name"
            continue
        fi
        sanitize < "$src" > "$REPO/config/fish/conf.d/$name.fish"
    done
fi

# --------------------------------------------------------------------- outros
for c in lazygit zed nvim; do
    if [[ -d "$HOME/.config/$c" ]]; then
        log "$c"
        rm -rf "$REPO/config/$c"
        cp -r "$HOME/.config/$c" "$REPO/config/$c"
        rm -rf "$REPO/config/$c/.git"
    fi
done
[[ -f "$HOME/.config/sddm/sugar-candy.conf" ]] && \
    cp "$HOME/.config/sddm/sugar-candy.conf" "$REPO/config/sddm/sugar-candy.conf"

# ------------------------------------------------------------------- pacotes
log "listas de pacotes"
comm -23 <(pacman -Qqe | sort) <(pacman -Qqm | sort) > /tmp/.repo-explicit.$$
OPT='^(msodbcsql17|freerdp|teamviewer|remmina)$'
grep -vE "$OPT" /tmp/.repo-explicit.$$ > "$REPO/packages/repo.txt"
pacman -Qqm | sort | grep -vE "$OPT" > "$REPO/packages/aur.txt"
{ grep -E "$OPT" /tmp/.repo-explicit.$$; pacman -Qqm | sort | grep -E "$OPT"; } \
    > "$REPO/packages/optional.txt" || true
rm -f /tmp/.repo-explicit.$$

# --------------------------------------------------------- rede de seguranca
log "varrendo o repo atras de segredo e dado pessoal"
LEAK=0
# O proprio scanner e o .gitignore contem os padroes que procuram — nao se auto-acusam.
SKIP=(--exclude-dir=.git --exclude=sync-from-system.sh --exclude=.gitignore)

if grep -rInE 'sk-[A-Za-z0-9_-]{16,}|ghp_|glpat-|AKIA|eyJ[A-Za-z0-9_-]{20,}' \
     "$REPO" "${SKIP[@]}" 2>/dev/null; then
    warn "^^ padrao de chave/token encontrado"; LEAK=1
fi
if grep -rInE '([0-9]{1,3}\.){3}[0-9]{1,3}' "$REPO" "${SKIP[@]}" --exclude='*.md' 2>/dev/null \
     | grep -vE '127\.0\.0\.1|0\.0\.0\.0|255\.255'; then
    warn "^^ endereco IP encontrado"; LEAK=1
fi
if grep -rIn "$USER" "$REPO" "${SKIP[@]}" 2>/dev/null; then
    warn "^^ nome de usuario vazou"; LEAK=1
fi
# Ferramentas proprias: nao sao segredo, mas nao vao para um repo publico e
# quebrariam na maquina de quem clonar.
if grep -rInE 'hangar|warpzone|CP_ENGINE|CP_SESSION_NAME' "$REPO" "${SKIP[@]}" 2>/dev/null; then
    warn "^^ referencia a ferramenta privada"; LEAK=1
fi

if [[ $LEAK -eq 1 ]]; then
    die "Achei coisa sensivel. Limpe o que esta acima ANTES de commitar."
fi

log "Limpo. Revise com 'git diff' e commite."
