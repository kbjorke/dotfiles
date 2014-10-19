# File to contain bash aliases:

# ls aliases:
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'



# Functions used to resize terminal.
function small_terminal()
{
   resize -s 15 80 > /dev/null
   clear
}
function large_terminal()
{
   resize -s 43 80 > /dev/null
   clear
}
function ordinary_terminal()
{
   resize -s 24 80 > /dev/null
   clear
}

# Aliases used to resize terminal:
alias st=small_terminal
alias lt=large_terminal
alias ot=ordinary_terminal

# Alias git commands
alias g='git'
alias gst='git status'
alias gad='git add'
alias gcm='git commit -m'
alias gp='git push'
alias gd='git diff'
