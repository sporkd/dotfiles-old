. ~/.paths
. ~/.zsh/config
. ~/.aliases
. ~/.zsh/aliases
. ~/.zsh/completion

# Distribution Specific settings
[[ -f ~/.distro ]] && . ~/.distro

# Hook for dotfiles containing sensitive data 
[[ -f ~/.personal ]] && . ~/.personal

# Hook for settings specific to one system
[[ -f ~/.local ]] && . ~/.local

# Ruby Version Manager
[[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm
