# File to contain bash aliases:

# Alias ls commands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

# Shortcuts to get to .basrc and .vimrc files and dotfiles
alias bashrc='vim -c "IDE" /home/kristian/dotfiles/bashrc'
alias bash_aliases='vim -c "IDE" /home/kristian/dotfiles/bash_aliases'
alias vimrc='vim -c "IDE" /home/kristian/dotfiles/vimrc'

# Shortcut to get to the dotfiles folder
alias gotodotfiles='cd /home/kristian/dotfiles/'

# Alias to open vim in IDE environment
alias vimIDE='vim -c "IDE"'


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


