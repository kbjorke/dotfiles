# File to contain bash aliases:

# Alias ls commands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsR='ls -lhR'

# Alias git commands
alias g='git'
alias gst='git status'
alias gad='git add'
alias gcm='git commit -m'
alias gp='git push'
alias gd='git diff'

# A quick way to get out of current directory
alias ..='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# Run ROOT
alias root='/opt/root/bin/root -l'

# Alias for tree command with size of files and directories
alias trees='tree -h --du'

# Shortcuts to get to .basrc and .vimrc files and dotfiles
alias bashrc='vim /home/kristian/dotfiles/bashrc'
alias bash_aliases='vim /home/kristian/dotfiles/bash_aliases'
alias vimrc='vim /home/kristian/dotfiles/vimrc'

# Shortcut to get to the dotfiles folder
alias gotodotfiles='cd $HOME/dotfiles/'

# Shortcut to get to the PhD folder
alias gotoPhD='cd $HOME/PhD'

# Alias to open vim in IDE environment
alias vimIDE='vim -c "IDE"'

# Alias that make you pipe to clipboard. Requires xclip.
alias clipboard="tr -d '\n' | xclip -sel clip"

# Run MAD-X :
alias madx="/opt/madx/./madx"


# Functions used to resize terminal.
function small_terminal()
{
   resize -s 15 $COLUMNS > /dev/null
   clear
}
function large_terminal()
{
   resize -s 43 $COLUMNS > /dev/null
   clear
}
function ordinary_terminal()
{
   resize -s 24 $COLUMNS > /dev/null
   clear
}
function wide_terminal()
{
   resize -s $LINES 160 > /dev/null
   clear
}
function thin_terminal()
{
   resize -s $LINES 80 > /dev/null
   clear
}

# Aliases used to resize terminal:
alias st=small_terminal
alias lt=large_terminal
alias ot=ordinary_terminal
alias wt=wide_terminal
alias tt=thin_terminal


