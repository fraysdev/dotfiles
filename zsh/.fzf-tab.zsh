## Sourcing fzf-tab
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

## Getting zstyle ':fzf-tab:{context}' for completion -- C-x h
bindkey '^Xh' _complete_help

## Configuration
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1la --git --no-time --color=always $realpath'

# Git
zstyle ':fzf-tab:complete:git-log:argument-1' fzf-preview 'git log --color=always $realpath'

# Pacman
zstyle ':fzf-tab:complete:pacman:*' fzf-preview 'pacman -Si $word'