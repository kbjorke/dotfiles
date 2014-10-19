# Dotfiles

**Made by:** *Kristian Bjørke*

## Introduction:

This repository consists the dotfiles that I have customized for my use and 
would like to keep and continue to develop. At the current time the content 
of this repository is mainly focused on my Gnome Terminal environment, 
through the bashrc file, and my Vim terminal text editor, which is used for
programming in Python, LaTeX and C++. At a later time I might add other 
dotfiles, if there are some other customizations that I would like to 
preserve.

This README.md file is made to explain the important features of my 
customization. Primarily so that I have an overview of the features without 
having to read through every dotfiles. Secondarily for other poeple wanting 
to understand my settings and customization.

## Software:

This section specifies the operations system and software for which these 
dotfiles are developed and used under.

**Operation system:**
```
kristian@kristian-pc:~$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 14.04.1 LTS
Release:        14.04
Codename:       trusty
```

**Gnome terminal:**
```
kristian@kristian-pc:~$ apt-cache show gnome-shell | grep Version
Version: 3.10.4-0ubuntu5.2
Version: 3.10.4-0ubuntu5
```

**Vim:**
```
kristian@kristian-pc:~$ vim --version
VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Jan  2 2014 19:39:32)
Inkluderte patcher: 1-52
Modifisert av pkg-vim-maintainers@lists.alioth.debian.org
```

**Python:**
```
kristian@kristian-pc:~$ python --version
Python 2.7.6
```

**LaTeX:**
```
kristian@kristian-pc:~$ tex --version
TeX 3.1415926 (TeX Live 2013/Debian)
kpathsea version 6.1.1
Copyright 2013 D.E. Knuth.

kristian@kristian-pc:~$ latex --version
pdfTeX 3.1415926-2.5-1.40.14 (TeX Live 2013/Debian)
kpathsea version 6.1.1
Copyright 2013 Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
```

**C++:**
```
kristian@kristian-pc:~$ gcc --version
gcc (Ubuntu 4.8.2-19ubuntu1) 4.8.2
Copyright (C) 2013 Free Software Foundation, Inc.
```

## Terminal features:

This section contains the user specified terminal features I have 
included in my basrc or bash_aliases files.

### Aliases:

This is a overview of the bash aliases that I have in my I have added a
short explanation of its use.

#### ls commands:
```
ll = 'ls -alF'
la = 'ls -A'
l  = 'ls -CF'
```

#### git commands:
```
g   = 'git'
gst = 'git status'
gad = 'git add'
gcm = 'git commit -m'
gp  = 'git push'
gd  = 'git diff'
```


#### resize terminal commands:

These commands are made to change the size of the terminal window.
The aliases are calls to functions defined in the bash_aliases file
that call the resize program. All terminal sizes have a width of 
80 spaces, what differs is the hight of the terminal window.

- `st` : Small terminal, hight of 15 spaces
- `lt` : Large terminal, hight of 43 spaces
- `ot` : Ordinary terminal, hight of 23 spaces
