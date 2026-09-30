#!/usr/bin/env bash
#
# caelestia-luismarchio03 — instalador
#
# Monta um desktop Caelestia (Hyprland + Quickshell) numa maquina Arch/CachyOS
# limpa: instala os pacotes e COPIA as configs deste repo para ~/.config.
#
# Este script NUNCA cria symlink para dentro do repo. As configs instaladas sao
# copias independentes: editar ~/.config depois nao mexe no repo, e atualizar o
# repo nao mexe na maquina. Para levar mudancas da maquina de volta para o repo,
# use ./sync-from-system.sh.
#
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP="$HOME/.config-backup-$STAMP"

DO_PACKAGES=1
DO_CONFIGS=1
DO_OPTIONAL=0
ASSUME_YES=0

usage() {
    cat <<'EOF'
Uso: ./install.sh [opcoes]

  --configs-only     So copia as configs, nao instala pacote
  --packages-only    So instala os pacotes, nao toca em ~/.config
  --with-optional    Inclui packages/optional.txt (RDP, driver ODBC)
  --yes              Nao pergunta nada (use com cuidado)
  -h, --help         Esta ajuda

Sem argumento faz tudo: pacotes + configs.
EOF
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --configs-only)  DO_PACKAGES=0 ;;
        --packages-only) DO_CONFIGS=0 ;;
        --with-optional) DO_OPTIONAL=1 ;;
        --yes|-y)        ASSUME_YES=1 ;;
        -h|--help)       usage; exit 0 ;;
        *) echo "Opcao desconhecida: $1" >&2; usage; exit 1 ;;
    esac
    shift
done

log()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m==>\033[0m %s\n' "$*"; }
die()  { printf '\033[1;31m==>\033[0m %s\n' "$*" >&2; exit 1; }

confirm() {
    [[ $ASSUME_YES -eq 1 ]] && return 0
    read -rp "$1 [s/N] " r
    [[ "$r" =~ ^[sSyY]$ ]]
}

# ---------------------------------------------------------------- verificacoes
command -v pacman >/dev/null || die "Isto aqui so roda em Arch/CachyOS (pacman nao encontrado)."
[[ $EUID -eq 0 ]] && die "Nao rode como root. O script chama sudo quando precisa."

AUR_HELPER=""
for h in paru yay; do
    command -v "$h" >/dev/null && { AUR_HELPER="$h"; break; }
done

cat <<EOF

  caelestia-luismarchio03
  -----------------------
  repo:    $REPO
  backup:  $BACKUP
  pacotes: $([[ $DO_PACKAGES -eq 1 ]] && echo sim || echo nao)
  configs: $([[ $DO_CONFIGS -eq 1 ]] && echo sim || echo nao)

  As configs existentes em ~/.config sao COPIADAS para o backup antes de
  qualquer sobrescrita. Nenhum symlink e criado.

EOF
confirm "Seguir?" || { echo "Cancelado."; exit 0; }

# -------------------------------------------------------------------- pacotes
if [[ $DO_PACKAGES -eq 1 ]]; then
    log "Sincronizando o banco do pacman"
    sudo pacman -Sy --noconfirm

    log "Instalando pacotes de repositorio ($(wc -l < "$REPO/packages/repo.txt"))"
    # --needed pula o que ja esta instalado na versao certa
    sudo pacman -S --needed --noconfirm - < "$REPO/packages/repo.txt"

    if [[ -n "$AUR_HELPER" ]]; then
        log "Instalando pacotes do AUR ($(wc -l < "$REPO/packages/aur.txt")) com $AUR_HELPER"
        "$AUR_HELPER" -S --needed --noconfirm $(tr '\n' ' ' < "$REPO/packages/aur.txt")
    else
        warn "Nenhum helper de AUR (paru/yay) encontrado."
        warn "Instale um e rode:  $AUR_HELPER -S --needed - < packages/aur.txt"
    fi

    if [[ $DO_OPTIONAL -eq 1 ]]; then
        log "Instalando opcionais"
        sudo pacman -S --needed --noconfirm $(grep -vE 'msodbcsql17' "$REPO/packages/optional.txt" | tr '\n' ' ') || true
        [[ -n "$AUR_HELPER" ]] && "$AUR_HELPER" -S --needed --noconfirm msodbcsql17 || true
    fi
fi

# -------------------------------------------------------------------- configs
if [[ $DO_CONFIGS -eq 1 ]]; then
    mkdir -p "$BACKUP"

    copy_config() {
        local name="$1" src="$REPO/config/$1" dst="$HOME/.config/$1"

        [[ -e "$src" ]] || { warn "nao existe no repo: $name"; return; }

        if [[ -L "$dst" ]]; then
            warn "$dst e um symlink (provavelmente gerenciado por outra ferramenta) — pulando"
            return
        fi

        if [[ -e "$dst" ]]; then
            cp -a "$dst" "$BACKUP/" && log "backup: $name -> $BACKUP/$name"
        fi

        mkdir -p "$(dirname "$dst")"
        rm -rf "$dst"
        cp -r "$src" "$dst"     # COPIA. nunca ln -s.
        log "instalado: ~/.config/$name"
    }

    for c in caelestia fish lazygit nvim zed; do
        copy_config "$c"
    done

    # hypr: so os arquivos de override, o resto vem do pacote caelestia
    mkdir -p "$HOME/.config/caelestia"
    if [[ -f "$REPO/config/hypr/hypr-vars.conf.example" ]]; then
        if [[ -s "$HOME/.config/caelestia/hypr-vars.conf" ]]; then
            warn "hypr-vars.conf ja tem conteudo — deixando como esta"
            log  "exemplo de monitores disponivel em config/hypr/hypr-vars.conf.example"
        else
            cp "$REPO/config/hypr/hypr-vars.conf.example" \
               "$HOME/.config/caelestia/hypr-vars.conf.example"
            log "exemplo copiado: ~/.config/caelestia/hypr-vars.conf.example"
            warn "edite-o com os seus monitores e renomeie para hypr-vars.conf"
        fi
    fi

    log "Configs instaladas. Backup do que existia antes: $BACKUP"
fi

# ---------------------------------------------------------------------- final
cat <<EOF

  Pronto.

  Falta fazer na mao (depende da sua maquina, o script nao adivinha):

    1. Monitores    -> ~/.config/caelestia/hypr-vars.conf
    2. Tela de login-> veja README, secao "SDDM"
    3. Wallpapers   -> jogue os seus em ~/Pictures/Wallpapers
    4. Shell padrao -> chsh -s /usr/bin/fish

  Backup das configs antigas: $BACKUP

EOF
