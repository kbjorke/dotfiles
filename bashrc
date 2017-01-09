# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

### CHANGED \w to \W in order to get only base directory name i terminal
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


### USER DEFINED SETTINGS: ###

# Setting up directory colors for terminal:
# Alternatives: 256dark, ansi-dark, ansi-light, ansi-universal
eval `dircolors ~/.dir_colors/dircolors-solarized/dircolors.ansi-dark`


# # GnuPG setup for gpg-agent
# envfile="$HOME/.gnupg/gpg-agent.env"
# #if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
# #        eval "$(cat "$envfile")"
# #    else
# #            eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
# #        fi
# #        export GPG_AGENT_INFO  # the env file does not contain the export statement
# #        export SSH_AUTH_SOCK   # enable gpg-agent for ssh
# 
# # Sets the Mail Environment Variable
# MAIL=/var/spool/mail/kristian && export MAIL

ROOTSYS="/opt/root/"
UiO="$HOME/Archive/Universetet\ i\ Oslo"
US="$HOME/Archive/University\ of\ Sussex"
PhD="$HOME/PhD"

# Allows to exclude when calling multiple files/folders
# Use: rm -rf !(one|two|three) [remove command exclude one, two and three]
shopt -s extglob

function screen_bash()
{
   # Migh want to add possibility to add arguments to bash script
   screen_name=$1 # Name of screen session
   screen_script=$2 # Name of bash script to be run
   screen -S $screen_name -dm bash $screen_script
}

function ps_screen()
{
   screen_PID=$1 # First number for screen displayed by "screen -ls"
   ps u -p $(ps -el | grep $(ps -el | grep $screen_PID | grep bash | awk '{print $4}') | grep bash | awk '{print $4}')
}

function ps_screen_name()
{
   screen_name=$1 # Name of screen session
   ps u -p $(ps -el | grep $(ps -el | grep $(screen -ls | grep $screen_name | awk '{print $1}' | sed -e "s/.$screen_name//") | grep bash | awk '{print $4}') | grep bash | awk '{print $4}')
}

function NewTexReport()
{
template_path="/home/kristian/PhD/various/tex_report_template"

title=$1

echo "New LaTeX report kbjorke-${title}.tex created in /report folder"

path="$(pwd)/report"

mkdir ${path}

# Make report folder structure
mkdir ${path}/aux
mkdir ${path}/img
mkdir ${path}/ref
mkdir ${path}/tex
mkdir ${path}/var
mkdir ${path}/lst

# Copy template and scripts into report folder
cp ${template_path}/kbjorke-TITLE.tex ${path}/kbjorke-${title}.tex
cp ${template_path}/bib_kbjorke_TITLE.bib ${path}/bib_kbjorke_${title}.bib
cp ${template_path}/compiletex.sh ${path}/compiletex.sh
cp ${template_path}/spellcheck.sh ${path}/spellcheck.sh
cp ${template_path}/updatebib.sh ${path}/updatebib.sh
cp ${template_path}/wordcount.sh ${path}/wordcount.sh

# Copy example image
cp ${template_path}/img/WIMP_detection.eps ${path}/img/WIMP_detection.eps

# Change specifics in scripts
sed -i "s:#TITLE#:${title}:" ${path}/kbjorke-${title}.tex
sed -i "s:PATH:${path}/:" ${path}/compiletex.sh
sed -i "s/FILENAME/kbjorke-${title}/" ${path}/compiletex.sh
sed -i "s/FILENAME/kbjorke-${title}/" ${path}/updatebib.sh
sed -i "s/FILENAME/kbjorke-${title}/" ${path}/wordcount.sh
}

function log()
{
    log_dir=$HOME/PhD/log

    month_list=(ZERO January February March April May June July August September October November December)
    weekday_list=(Sunday Monday Tuesday Wedensday Thursday Friday Saturday)

    year=$(date +%Y)
    month=$(date +%m)
    day=$(date +%d)

    time=$(date +%H:%M)
    time_zone=$(date +%Z)

    weekday=$(date +%w)
         
    logfile=$log_dir/$year/${year}-${month}_log.txt

    if [ ! -d "$log_dir/$year" ]; then
        mkdir $log_dir/$year
    fi
    
    if [ ! -f "$logfile" ]; then

        touch $logfile 

        header=$"### PhD position log ###

# By Kristian Bjørke
# University of Oslo

Year: ${year}
Month: ${month_list[${month#0}]}"

        echo "$header" > $logfile
    fi

    if ! grep -q "${weekday_list[${weekday#0}]} $day ${month_list[${month#0}]}" $logfile;  then

        day_header="$(printf "\n\n-------------- %9s %2s %-9s ------------------" ${weekday_list[${weekday#0}]} $day ${month_list[${month#0}]})"

        echo "$day_header" >> $logfile
    fi

    entry="$(printf "\n%s %s:" $time $time_zone)"

    echo "$entry" >> $logfile
    echo "" >> $logfile

    vim -c "startinsert" + $logfile -c 'normal zz'
}

function SyncPhD()
{
   unison -auto -batch $HOME/PhD ssh://kribjork@hyper.uio.no/PhD
}

function SyncPhD_MOD()
{
   unison $HOME/PhD ssh://kribjork@hyper.uio.no/PhD
}

function BackupPhD()
{
   SyncPhD
   echo "PhD syncronized with hyper.uio.no"

   Storage=/media/kristian/kbjorke-uio-enc    

   DirToBackup=/home/kristian/PhD/
   BackupDir="$Storage/PhDBackup"
   
   rsync --recursive --update --delete --perms --owner --group --times --links --safe-links --super --one-file-system --devices $DirToBackup $BackupDir

   echo "Main backup at: $Storage/PhDBackup"
   
   rsync --archive --update --verbose --human-readable --compress --rsh=ssh $DirToBackup hyper:/scratch/Backup_PhD

   echo "Secondary backup at: kribjork@hyper.uio.no:/scratch/Backup_PhD"
}


function BackupWebpage()
{
   DirToBackup=hyper:www_docs/
   BackupDir=/home/kristian/PhD/various/Backup-www_docs/
   
   rsync --archive --update --delete --verbose --human-readable --compress --rsh=ssh $DirToBackup $BackupDir

   echo "Main backup at: $BackupDir"
}
