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

# Run LAMMPS
alias lammps='lammps-daily'

# Run ATOMIFY
alias atomify='/opt/atomify/./atomify'

# Run pizza.py
alias pizza='/home/kristian/WorkSpace/lammps/pizza-9Oct15/src/pizza.py'

# Run Atlantis
alias atlantis='java -jar /opt/atlantis/AtlantisJava-09-16-05-23/atlantis.jar'

# Run Vidyo
alias vidyo='/opt/vidyo/VidyoDesktop/VidyoDesktop'

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

# Shortcut to get to the Qualification Task folder
alias gotoThesis='cd $HOME/PhD/project/Thesis/'

# Shortcut to get to the WorkSpace folder
alias gotoWS='cd $HOME/WorkSpace'

# Shortcut to get to the Qualification Task folder
alias gotoQT='cd $HOME/PhD/ATLAS/qualification-task/'

# Shortcut to get to the FYS2160 folder
alias gotoFYS2160='cd $HOME/PhD/teaching/FYS2160/h2019'

# Shortcut to get to the FYS2160 folder
alias gotoFYSMEK='cd $HOME/PhD/teaching/FYS-MEK1110'

# Shortcut to get to the MonoH project folder
alias gotoMonoH='cd $HOME/PhD/project/Mono_Higgs'

# Shortcut to get to the ATLAS folder
alias gotoATLAS='cd $HOME/PhD/ATLAS'

# Open new fullscreen terminal suitable to write code
alias work='gnome-terminal.real --profile=CodeWritting --full-screen'

# Alias to open vim in IDE environment
alias vimIDE='vim -c "IDE"'

# Alias that make you pipe to clipboard. Requires xclip.
alias clipboard="tr -d '\n' | xclip -sel clip"
alias pwdc="pwd | clipboard" # Current directory to clipboard

# Change directory to clipboard content
#alias cdc="cd $(xclip -o -selection clipboard)"

# Run MATLAB :
alias matlab='/opt/matlab/bin/./matlab'

# Run VMD :
alias vmd='/opt/vmd/bin/./vmd'

# Run MAD-X :
alias madx='/opt/madx/./madx'

# Run MadGraph5 :
alias mg5='/home/kristian/WorkSpace/madgraph/MG5_aMC_v2_6_0/bin/./mg5_aMC'

# Remote desktop to UiO Windows
alias uio-xfreerdp='xfreerdp --plugin cliprdr -u kribjork -d uio win.uio.no'

# Run elma2
alias elma2='cd /opt/elma2/ && ./elma2 && cd ~-'

# Run unison
alias unison='$HOME/unison/./unison-2.40.61-linux-x86_64-text-static'

# To open files ("double-click")
alias xopen='xdg-open'

# To copy content of file to clipboard

# ssh to workfolder in lxplus
alias lxplus-work='ssh -t lxplus "cd /afs/cern.ch/work/k/krbjoerk ; bash"'

alias cpcont='xclip -sel c'

# Alias to fix wifi, used when two arrows show not signal strength
alias fixWifi='sudo systemctl restart network-manager'

# Alias to connect to UiO VPN
alias uioVPN='sudo vpnc-connect /etc/vpnc/uiovpn.conf'

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

function search_pdf()
{
   pdfgrep -R -n -i ./*
}

# Aliases used to resize terminal:
alias st=small_terminal
alias lt=large_terminal
alias ot=ordinary_terminal
alias wt=wide_terminal
alias tt=thin_terminal


