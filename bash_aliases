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
   resize -s 24 80 > /dev/null
   clear
}
function wide_terminal()
{
   resize -s $LINES 160 > /dev/null
   clear
}

# Aliases used to resize terminal:
alias st=small_terminal
alias lt=large_terminal
alias ot=ordinary_terminal
alias wt=wide_terminal
