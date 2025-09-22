### Zoxide
eval "$(zoxide init zsh)"

### Fzf -- Fuzzy finder
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude='.git'"
export FZF_DEFAULT_OPTS="--height=50% --layout=default --border=rounded"

# CTRL_T command & opts
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"

# ALT_C command & opts
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude='.git'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --icons {} | head -200'"

# Tmux fzf conf
export FZF_TMUX_OPTS=" -p90%,70%"