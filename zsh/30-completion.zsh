# Initiate compinit (unused)
#autoload -U compinit; compinit

# Source zsh-autocomplete
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

bindkey -M menuselect '^I'                menu-complete
bindkey -M menuselect "$terminfo[kcbt]"   reverse-menu-complete
