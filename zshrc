. ~/.paths
. ~/.zsh/config
. ~/.aliases
. ~/.zsh/aliases
. ~/.zsh/completion

# Distribution Specific settings
[[ -f ~/.distrorc ]] && . ~/.distrorc

# Hook for dotfiles containing sensitive data 
[[ -f ~/.privaterc ]] && . ~/.privaterc

# Hook for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# Ruby Version Manager
[[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm

