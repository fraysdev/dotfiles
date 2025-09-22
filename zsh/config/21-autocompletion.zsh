# Initiate compinit (unused; use plugin)
#autoload -U compinit; compinit

# Source the plugin
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

bindkey -M menuselect              '^I'           menu-complete
bindkey -M menuselect "$terminfo[kcbt]"   reverse-menu-complete
