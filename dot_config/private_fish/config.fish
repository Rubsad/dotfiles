## Environment

# XDG
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"
# Custom Home Directories
set -x CHD_SRC_HOME "$HOME/.local/src"
set -x CHD_BIN_HOME "$HOME/.local/bin"

# Clean Home
set -x GOPATH "$CHD_SRC_HOME/go"
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x PNPM_HOME "$XDG_DATA_HOME/pnpm"
set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -x LESSHISTFILE "$XDG_CACHE_HOME/less/history"
set -x NODE_REPL_HISTORY "$XDG_DATA_HOME/node_repl_history"
set -x WINEPREFIX "$XDG_DATA_HOME/wine"
set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"

# Custom
set -x PATH "$CHD_BIN_HOME:$CARGO_HOME/bin:$GOPATH/bin:$PNPM_HOME:$PATH"
set -x EDITOR nano
set -x BROWSER brave
set -x TERMINAL alacritty

## Main
if status is-interactive
    # No Greeting
    set fish_greeting

    # Theme
    # TokyoNight Color Palette
    set -l foreground c0caf5
    set -l selection 364A82
    set -l comment 565f89
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment

    # Aliases
    source $HOME/.config/shell/aliases
    alias zf="cd (z -l | awk '{print \$2}' | fzf)"

    # Prompt
    starship init fish | source
end

[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Hyprland >/dev/null 2>&1 && exec Hyprland
