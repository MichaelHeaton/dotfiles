alias python=/usr/bin/python3

autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /opt/homebrew/bin/terraform terraform
eval "$(starship init zsh)"
alias dotfiles='/usr/bin/git --git-dir=/Users/michaelheaton/.dotfiles/ --work-tree=/Users/michaelheaton'
