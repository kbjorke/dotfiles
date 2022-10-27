# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

ZSH_BASE=$HOME/dotfiles # Base directory for ZSH configuration

source $ZSH_BASE/antigen/antigen.zsh # Load Antigen

# Ensure colors work properly on Alpine
autoload colors && colors

antigen use oh-my-zsh # Yes, I want to use Oh My ZSH

# Terminal stuff
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle z

# Do OS dependant stuff
case `uname` in
  Darwin)
    # Commands for macOS go here
    antigen bundle macos
  ;;
  Linux)
    # Commands for Linux go here
  ;;
esac

# Set the theme
#antigen theme ys
antigen theme romkatv/powerlevel10k

# And lastly, apply the Antigen stuff
antigen apply

# Default editor
export EDITOR=nvim

# autosuggestions keybindings
#bindkey '^ ' autosuggest-accept
bindkey '^E' autosuggest-accept

# Needs to go after antigen
source ~/.bash_aliases


## Commented out until gcloud supports Python 3.10
## https://issuetracker.google.com/issues/205238176
#if [ -d '/opt/homebrew/opt/python@3.9' ]; then PATH="/opt/homebrew/opt/python@3.9/bin:$PATH"; fi
##if [ -d '/opt/homebrew/opt/python@3.10' ]; then PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"; fi
#
#if [ -d '/Users/david/go/bin' ]; then path+=('/Users/david/go/bin'); fi
#if [ -d '/opt/metasploit-framework/bin/' ]; then path+=('/opt/metasploit-framework/bin/'); fi
#if [ -d '/opt/homebrew/opt/mysql-client/bin' ]; then path+=('/opt/homebrew/opt/mysql-client/bin'); fi
#
## The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/david/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/david/Downloads/google-cloud-sdk/path.zsh.inc'; fi
#
## The next line enables shell command completion for gcloud.
#if [ -f '/Users/david/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/david/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
#

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
