## Z Shell Configuration
## By FrankyRayMS

# for config ($ZDOTDIR/*.zsh) source $config

## ===[ Bash-like Functionality ]===
# Bash navigation
autoload -U select-word-style
select-word-style bash

# Move left/right word with ALT+Arrow
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word


## ===[ History ]===
HISTFILE=~/.zhistory
HISTSIZE=500000
SAVEHIST=500000

setopt INC_APPEND_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY


## ===[ Aliases ]===
alias ll="eza -la --icons --git --git-ignore"
alias lt="eza -la --icons --git --git-ignore --tree"

alias gl="git log --all --graph --pretty=format:'%C(magenta)%h  %C(blue)%aI  %C(yellow)%an <%ae>%C(auto)  %D%n%s%n'"


## ===[ Promp ]===
# Starship
# eval "$(starship init zsh)"

# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/omp/frays.omp.toml)"


## ===[ Completion ]===
# Initiate compinit
autoload -U compinit; compinit

# Debugging
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%d'
zstyle ':completion:*:descriptions' format '[%d]'

# Using plugin 'zsh-autocompletion'
# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# bindkey -M menuselect              '^I'           menu-complete
# bindkey -M menuselect "$terminfo[kcbt]"   reverse-menu-complete

# Using plugin 'Aloxaf/fzf-tab'
# source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.config/zsh/.fzf-tab.zsh


## ===[ Suggestion ]===
# Using plugin 'zsh-autosuggestions'
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


## ===[ Syntax Highlighting ]===
# Using plugin 'zsh-syntax-highlighting'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Config
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern cursor)


## ===[ Programs ]===
# Zoxide
eval "$(zoxide init zsh)"


## ===[ Fuzzy Finder ]===
## Initiate
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