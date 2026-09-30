<div align="center">

# caelestia-marchio

**A minha configuração do [Caelestia](https://github.com/caelestia-dots/caelestia) — com instalador de máquina nova.**

Um desktop Hyprland + Quickshell, do jeito que eu uso. Não é um rice novo: é uma camada fina de configuração em cima de um projeto que já é lindo por conta própria.

<br>

[![Base: Caelestia](https://img.shields.io/badge/base-Caelestia-cba6f7?style=for-the-badge)](https://github.com/caelestia-dots/caelestia)
[![Hyprland](https://img.shields.io/badge/Hyprland-0.56-58E1FF?style=for-the-badge&logo=hyprland&logoColor=black)](https://hypr.land)
[![Quickshell](https://img.shields.io/badge/Quickshell-0.3-41CD52?style=for-the-badge&logo=qt&logoColor=white)](https://quickshell.outfoxxed.me)
[![Arch](https://img.shields.io/badge/Arch%20%2F%20CachyOS-1793D1?style=for-the-badge&logo=archlinux&logoColor=white)](https://cachyos.org)

[![fish](https://img.shields.io/badge/fish-4.9-4AAE47?style=for-the-badge&logoColor=white)](https://fishshell.com)
[![Neovim](https://img.shields.io/badge/Neovim-0.12-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io)
[![foot](https://img.shields.io/badge/foot-1.28-8A8A8A?style=for-the-badge)](https://codeberg.org/dnkl/foot)
[![SDDM](https://img.shields.io/badge/SDDM-sugar--candy-E95420?style=for-the-badge)](https://github.com/Kangie/sddm-sugar-candy)
[![MIT](https://img.shields.io/badge/licen%C3%A7a-MIT-a6e3a1?style=for-the-badge)](LICENSE)

[![Último commit](https://img.shields.io/github/last-commit/LuisMarchio03/caelestia-marchio?style=flat-square&color=cba6f7)](https://github.com/LuisMarchio03/caelestia-marchio/commits)
[![Tamanho](https://img.shields.io/github/repo-size/LuisMarchio03/caelestia-marchio?style=flat-square&color=89b4fa)](https://github.com/LuisMarchio03/caelestia-marchio)
[![Stars](https://img.shields.io/github/stars/LuisMarchio03/caelestia-marchio?style=flat-square&color=f9e2af)](https://github.com/LuisMarchio03/caelestia-marchio/stargazers)

</div>

<br>

> [!IMPORTANT]
> ### Isto aqui não é o Caelestia
>
> Todo o trabalho de verdade — o shell, a barra, o dashboard, as animações, o esquema de cores dinâmico — é do **[caelestia-dots/caelestia](https://github.com/caelestia-dots/caelestia)**, mantido por [@soramanew](https://github.com/soramanew).
>
> Se você chegou aqui procurando o rice, **vá para o projeto original**. É lá que mora o código, a documentação completa e a comunidade:
>
> | | |
> |---|---|
> | Dotfiles | [caelestia-dots/caelestia](https://github.com/caelestia-dots/caelestia) |
> | Shell (Quickshell) | [caelestia-dots/shell](https://github.com/caelestia-dots/shell) |
> | CLI | [caelestia-dots/cli](https://github.com/caelestia-dots/cli) |
>
> Este repositório é só **a minha config pessoal** em cima dele: alguns arquivos de override, a lista dos programas que eu uso e um script que monta tudo numa máquina limpa. Nada do código do Caelestia foi modificado ou copiado para cá.

<br>

## Screenshots

<div align="center">

<!-- Adicione as imagens em docs/ e descomente este bloco.

| Desktop | Dashboard |
|:---:|:---:|
| <img src="docs/desktop.png" width="400"> | <img src="docs/dashboard.png" width="400"> |

| Launcher | Tela de login |
|:---:|:---:|
| <img src="docs/launcher.png" width="400"> | <img src="docs/login.png" width="400"> |

-->

_Screenshots em breve._

</div>

<br>

## O que tem aqui

<table>
<tr><td width="50%" valign="top">

**⚙️ Configuração**

Os arquivos de *override* que o Caelestia oferece ao usuário — `shell.json`, `hypr-user.conf`, `hypr-vars.conf` — mais as configs de fish, Neovim, lazygit, Zed e do tema de login.

</td><td width="50%" valign="top">

**📦 Instalador**

`install.sh` levanta uma máquina Arch do zero: 218 pacotes de repositório, 27 do AUR, e copia as configs para `~/.config` guardando backup do que existia.

</td></tr>
<tr><td width="50%" valign="top">

**🔄 Backup**

`sync-from-system.sh` faz o caminho inverso — puxa `~/.config` para o repo, filtrando dado sensível e abortando se achar chave, IP privado ou caminho pessoal.

</td><td width="50%" valign="top">

**🔒 Sem dado pessoal**

Repositório público, então nada de credencial, rede interna, coisa de trabalho ou ferramenta própria. O filtro é automático e o script recusa commitar se algo escapar.

</td></tr>
</table>

<br>

## Stack

| Camada | Escolha |
|---|---|
| Compositor | [Hyprland](https://hypr.land) |
| Shell / barra | [Caelestia](https://github.com/caelestia-dots/shell) sobre [Quickshell](https://quickshell.outfoxxed.me) |
| Terminal | [foot](https://codeberg.org/dnkl/foot) |
| Shell | [fish](https://fishshell.com) + [starship](https://starship.rs) |
| Editor | [Neovim](https://neovim.io) com [LazyVim](https://lazyvim.org) e tema Caelestia |
| Tela de login | SDDM + [sugar-candy](https://github.com/Kangie/sddm-sugar-candy) |
| Git | [lazygit](https://github.com/jesseduffield/lazygit) |

O `caelestia-meta` puxa sozinho o Hyprland, fish, foot, eza, starship, btop e fastfetch — por isso eles não aparecem em `packages/repo.txt`.

<br>

## Instalação

> [!WARNING]
> Feito para máquina **nova**. Em máquina com rice já configurado, rode com `--configs-only` e revise o backup antes de reiniciar a sessão.

```bash
git clone https://github.com/LuisMarchio03/caelestia-marchio.git
cd caelestia-marchio
./install.sh
```

<details>
<summary><b>Opções</b></summary>

<br>

```bash
./install.sh --configs-only     # só as configs, não instala pacote
./install.sh --packages-only    # só os pacotes
./install.sh --with-optional    # inclui RDP e driver ODBC
./install.sh --yes              # não pergunta nada
```

</details>

<details>
<summary><b>O que ele faz com as suas configs atuais</b></summary>

<br>

Antes de sobrescrever qualquer coisa, copia o que existia para `~/.config-backup-<data>`.

As configs são instaladas por **cópia**, nunca por symlink. Isso é de propósito: depois de instalar, as configs da máquina e o repo ficam independentes nos dois sentidos — editar `~/.config` não suja o repo, e um `git pull` aqui não muda a sua máquina. Para levar mudanças de volta, use o `sync-from-system.sh`.

Se encontrar um symlink onde ia escrever (sinal de que outra ferramenta gerencia aquilo), ele pula e avisa em vez de atropelar.

</details>

### Depois de instalar

Quatro coisas dependem da sua máquina e o script não adivinha:

1. **Monitores** — copie `~/.config/caelestia/hypr-vars.conf.example` para `hypr-vars.conf` e ajuste com o que `hyprctl monitors` mostrar.
2. **Wallpapers** — os seus em `~/Pictures/Wallpapers`.
3. **Shell padrão** — `chsh -s /usr/bin/fish`.
4. **Tela de login** — veja abaixo.

<details>
<summary><b>Configurar o SDDM</b></summary>

<br>

```bash
sudo cp config/sddm/sugar-candy.conf /usr/share/sddm/themes/sugar-candy/theme.conf
sudo cp SEU_WALLPAPER.jpg /usr/share/sddm/themes/sugar-candy/Backgrounds/
# aponte a chave Background= para o arquivo que você copiou
echo -e '[Theme]\nCurrent=sugar-candy' | sudo tee /etc/sddm.conf.d/theme.conf
```

O tema aplica `DimBackgroundImage="0.3"` e desfoque parcial de raio 60 atrás do formulário. Zere os dois se quiser a imagem limpa.

</details>

<br>

## Por que override e não fork

O Caelestia carrega dois arquivos seus, em momentos diferentes:

| Arquivo | Quando carrega | Para quê |
|---|---|---|
| `caelestia/hypr-vars.conf` | **Antes** dos configs do Caelestia | Monitores, workspaces, variáveis que os dots já gerenciam |
| `caelestia/hypr-user.conf` | **Depois** de tudo | Regras de janela e binds próprios |
| `caelestia/shell.json` | Em tempo de execução | Barra, dashboard, launcher, lock, idle |

Editar os arquivos do próprio Caelestia funciona até o primeiro `caelestia update` — daí em diante é conflito em cima de conflito, toda atualização. Por isso aqui só existem overrides, e o Caelestia vem do pacote oficial, intocado.

<br>

## Mantendo o repo em dia

```bash
./sync-from-system.sh    # ~/.config  ---->  repo
git diff                 # sempre revise
git commit -am "configs: ..."
```

Mão única. O script não altera nada no sistema e aborta se encontrar chave, token, IP privado, nome de usuário ou referência a ferramenta que não existe fora da minha máquina.

<br>

## Estrutura

```
├── install.sh                 instala pacotes e copia configs para ~/.config
├── sync-from-system.sh        puxa ~/.config para o repo, com filtro
├── packages/
│   ├── repo.txt               218 pacotes de repositório (pacman)
│   ├── aur.txt                27 pacotes do AUR (paru/yay)
│   └── optional.txt           RDP e driver ODBC — só com --with-optional
└── config/
    ├── caelestia/             shell.json, overrides do Hyprland, toggle de blur
    ├── fish/                  config, conf.d e funções
    ├── hypr/                  hypr-vars.conf.example (monitores)
    ├── nvim/                  LazyVim com tema Caelestia
    ├── lazygit/  zed/
    └── sddm/                  tema da tela de login
```

<br>

## Notas de versão

As configs saíram de uma máquina com `caelestia-shell 2.2.0`. Da **2.5.0** em diante o `shell.json` mudou:

| Chave | O que houve |
|---|---|
| `perMonitorWorkspaces` | Removida |
| `useTwelveHourClock` | Virou `clockFormat` |

Se você está na 2.5.0+, ajuste essas duas depois de instalar.

<br>

## Créditos

<div align="center">

**[caelestia-dots](https://github.com/caelestia-dots)** — [@soramanew](https://github.com/soramanew)

O rice é deles. Aqui é só a minha configuração.

Também: [Quickshell](https://quickshell.outfoxxed.me) · [Hyprland](https://hypr.land) · [sugar-candy](https://github.com/Kangie/sddm-sugar-candy) · [LazyVim](https://lazyvim.org)

<br>

<sub>Se este repo te ajudou, a estrela vai para <a href="https://github.com/caelestia-dots/caelestia">o projeto original</a>.</sub>

</div>
