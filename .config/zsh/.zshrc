# Z-Shell configuration

# Bash-like functionality
autoload -U select-word-style
select-word-style bash
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# History
HISTFILE=~/.zhistory
HISTSIZE=500000
SAVEHIST=500000

setopt INC_APPEND_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

# Completions
autoload -U compinit; compinit
#debug
zstyle ":completion:*" verbose yes
zstyle ":completion:*" format "%d"
zstyle ":completion:*:descriptions" format "[%d]"

# Aliases
alias ll="eza -la --icons --group-directories-first"
alias lt="eza -la --icons --group-directories-first --tree"
alias lg="eza -la --icons --group-directories-first --git --git-ignore"

alias gl="git log --all --graph --pretty=format:'%C(magenta)%h  %C(blue)%aI  %C(yellow)%an <%ae>%C(auto)  %D%n%s%n'"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Prompt
eval "$(oh-my-posh init zsh --config ~/.config/omp/minimal.omp.toml)"

# Program Setup
eval "$(zoxide init zsh --cmd cd)"

source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude='.git'"
export FZF_DEFAULT_OPTS="--height=99% --reverse --style=minimal"
# CTRL_T command & opts
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
# ALT_C command & opts
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude='.git'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --icons {} | head -200'"
# Tmux fzf conf
export FZF_TMUX_OPTS=" -p90%,70%"
export PATH="$HOME/.local/bin:$PATH"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit light Aloxaf/fzf-tab
# Getting zstyle ':fzf-tab:{context}' for completion -- C-x h
bindkey '^Xh' _complete_help
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1la --git --no-time --color=always $realpath'
zstyle ':fzf-tab:complete:git-log:argument-1' fzf-preview 'git log --color=always $realpath'
zstyle ':fzf-tab:complete:pacman:*' fzf-preview 'pacman -Si $word'
# Collection of fzf-tab completion sources: https://github.com/Freed-Wu/fzf-tab-source

zinit light zsh-users/zsh-syntax-highlighting
ZSH_HIGHTLIGHT_HIGHLIGHTERS+=(brackets pattern cursor)

zinit light zsh-users/zsh-autosuggestions

zinit light zsh-users/zsh-completions

zinit light zsh-users/zsh-history-substring-search

zinit light MichaelAquilina/zsh-you-should-use

zinit light hlissner/zsh-autopair
