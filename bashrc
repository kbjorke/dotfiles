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
    xterm-color) color_prompt=yes;;
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

# Set up ROOT
#source /home/kristian/Nedlastingar/root-6.05.02/bin/thisroot.sh

# GnuPG setup for gpg-agent
envfile="$HOME/.gnupg/gpg-agent.env"
#if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
#        eval "$(cat "$envfile")"
#    else
#            eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
#        fi
#        export GPG_AGENT_INFO  # the env file does not contain the export statement
#        export SSH_AUTH_SOCK   # enable gpg-agent for ssh

# Sets the Mail Environment Variable
MAIL=/var/spool/mail/kristian && export MAIL

MSc="$HOME/Dokument/University_of_Sussex/MScProject"

function log()
{
    log_dir=/home/kristian/Dokument/University_of_Oslo/log

    month_list=(ZERO January February March April May June July August September October November December)

    year=$(date +%Y)
    month=$(date +%m)
    day=$(date +%d)

    time=$(date +%H:%M:%S)

    weekday=$(date +%w)
         
    logfile=$log_dir/$year/${year}-$month/${year}-${month}-${day}_log.txt

    if [ ! -d "$log_dir/$year" ]; then
         mkdir $log_dir/$year
    fi
    
    if [ ! -d "$log_dir/$year/${year}-$month" ]; then
         mkdir $log_dir/$year/${year}-$month
    fi
    
    if [ ! -d "$logfile" ]; then

         touch $logfile 

         header=$"### PhD position log ###

# By Kristian Bjørke
# University of Oslo

Year: ${year}
Month: ${month_list[${month#0}]}"

         echo "$header" > $logfile
    fi
}

#function BackupMSc()
#{
#    mount_point=/dev/sda5
#    
#    if mount | grep "$mount_point" > /dev/null;
#    then
#        Storage=$(mount | grep $mount_point | grep -Po '(on\s)\K[^\s]*')
#        unmount=false
#    else
#        Storage=/media/kristian/storage
#        unmount=true
#    
#        sudo mkdir $Storage
#        sudo mount /dev/sda5 $Storage
#    fi
#    
#    DirToBackup=/home/kristian/Dokument/University_of_Sussex/MScProject/
#    BackupDir="$Storage/Dokumenter/MScBackup"
#    
#    
#    timestamp=$(date "+%Y-%m-%d_%H-%M-%S")
#    
#    sudo install --directory "$BackupDir/history/$timestamp"
#    sudo install --directory "$BackupDir/backup/"
#    sudo install --directory "$BackupDir/log/$timestamp"
#    
#    echo "Backup $timestamp"
#    
#    rsync --dry-run --itemize-changes --out-format="%i|%n|"  --recursive --update --delete --perms --owner --group --times --links --safe-links --super --one-file-system --devices $DirToBackup "$BackupDir/backup" | sed '/^ *$/d' > "$BackupDir/log/$timestamp/dryrun.log"
#    
#    grep "^.f" "$BackupDir/log/$timestamp/dryrun.log" >> "$BackupDir/log/$timestamp/onlyfiles.log"
#    grep "^.f+++++++++" "$BackupDir/log/$timestamp/onlyfiles.log" | awk -F '|' '{print $2 }' | sed 's@^/@@' >> "$BackupDir/log/$timestamp/created.log"
#    grep --invert-match "^.f+++++++++" "$BackupDir/log/$timestamp/onlyfiles.log" | grep --invert-match "^.f\.\.\.pog\.\.\." | grep --invert-match "^.f\.\.\.p\.\.\.\.\." | awk -F '|' '{print $2 }' | sed 's@^/@@' >> "$BackupDir/log/$timestamp/changed.log"
#    
#    grep "^\.d" "$BackupDir/log/$timestamp/dryrun.log" | grep --invert-match "^.d\.\.\.pog\.\.\." | grep --invert-match "^.f\.\.\.p\.\.\.\.\." | awk -F '|' '{print $2 }' | sed -e 's@^/@@' -e 's@^\./@@' -e 's@/$@@' >> "$BackupDir/log/$timestamp/changed.log"
#    grep "^cd" "$BackupDir/log/$timestamp/dryrun.log" | awk -F '|' '{print $2 }' | sed -e 's@^/@@' -e 's@/$@@' >> "$BackupDir/log/$timestamp/created.log"
#    
#    grep "^*deleting" "$BackupDir/log/$timestamp/dryrun.log" | awk -F '|' '{print $2 }' >> "$BackupDir/log/$timestamp/deleted.log"
#    
#    cat "$BackupDir/log/$timestamp/deleted.log" > /tmp/tmp.rsync.list
#    cat "$BackupDir/log/$timestamp/changed.log" >> /tmp/tmp.rsync.list
#    sort --output=/tmp/rsync.list --unique /tmp/tmp.rsync.list
#    
#    rsync --update --perms --owner --group --times --links --super --files-from=/tmp/rsync.list "$BackupDir/backup" "$BackupDir/history/$timestamp/"
#    
#    rsync --recursive --update --delete --perms --owner --group --times --links --safe-links --super --one-file-system --devices $DirToBackup "$BackupDir/backup"
#    
#    if mount | grep "$mount_point" > /dev/null;
#    then
#        if $unmount; then
#            sudo umount $Storage
#            sudo rm -r $Storage
#        fi
#    fi
#
#    echo "Main backup at: $mount_point/Dokumenter/MScBackup"
#    
#    rsync --archive --update --verbose --human-readable --compress --rsh=ssh $DirToBackup feynman:MScBackup
#
#    echo "Secondary backup at: kb339@feynman.hpc.susx.ac.uk:MScBackup"
#}
