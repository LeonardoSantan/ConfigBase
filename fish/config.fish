# ~/.config/fish/config.fish

# Comandos para sessões interativas
if status is-interactive
    # Aqui você pode adicionar comandos específicos para sessões interativas
end

if status is-interactive
    and not set -q TMUX
    tmux new-session
end

# --- Configurações de Homebrew ---
set -Ux HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
set -Ux HOMEBREW_CELLAR $HOMEBREW_PREFIX/Cellar
set -Ux HOMEBREW_REPOSITORY $HOMEBREW_PREFIX/Homebrew
fish_add_path $HOMEBREW_PREFIX/bin
fish_add_path $HOMEBREW_PREFIX/sbin
fish_add_path $HOMEBREW_PREFIX/share/man
fish_add_path $HOMEBREW_PREFIX/share/info

# --- Configurações do Cargo ---
set -Ux PATH $HOME/.cargo/bin $PATH

# --- Configurações do OpenSSL ---
set -Ux OPENSSL_DIR /usr
set -Ux OPENSSL_LIB_DIR /usr/lib64
set -Ux OPENSSL_INCLUDE_DIR /usr/include

# --- Plugins com Fisher ---
# (Se ainda não tiver instalado, execute os comandos abaixo uma vez, depois comente ou remova)

# Instalar Fisher (caso ainda não esteja instalado):
# curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Instalar plugins:
# fisher install IlanCosman/tide
# fisher install jorgebucaran/fish-autosuggestions
# fisher install fish-syntax-highlighting
# fisher install jethrokuan/z
# fisher install PatrickF1/fzf.fish

# Após instalar o Tide, configure-o:
# tide configure

# --- Aliases e Outras Customizações ---
alias ll="ls -l --color=auto"
alias la="ls -la --color=auto"

alias studio="~/opt/android-studio/bin/studio.sh"
