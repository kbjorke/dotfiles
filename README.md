# Dotfiles

**Made by:** *Kristian Bjørke*

## Introduction:

This repository consists the dotfiles that I have customized for my use and 
would like to keep and continue to develop. At the current time the content 
of this repository is mainly focused on my Gnome Terminal environment, 
through the bashrc file, and my Vim terminal text editor, which is used for
programming in Python, LaTeX, C++ and R. At a later time I might add other 
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

**R:**
```
kristian@kristian-pc:~$ R --version
R version 3.0.2 (2013-09-25) -- "Frisbee Sailing"
Copyright (C) 2013 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)
```

## Installation and usage:

This section describes how to install these dotfiles, so that they can
apply to the system.

**Installation:**

Clone this repository to the home directory as \dotfiles by running in 
the home directory:
```
git clone https://github.com/kbjorke/dotfiles.git
```
(Alternatively do this, which includes the submodules so you can skip
the submodule update step below.
```
git clone --recursive https://github.com/kbjorke/dotfiles.git
```
)

Once this respository is cloned in the home folder the dotfiles from the 
repository can be set up by runing the
bash script makesymlinks.sh. This script moves old dotfiles to a folder
called \dotfiles_old then makes soft links from the dotfiles in the
\dotfiles folder in the home directory. Command to run the script:
```
bash maksymlinks.sh
```

Then to include the submodules run the following in the \dotfiles folder:
```
git submodule update --init --recursive
```



**Updating Vim plugins:**

All the Vim plugins that I have got from other Git repositories I have
included as submodules in order to be able to keep them up to date.

Also folders for the Solarized colorschemes for the terminal are kept as
submodules.

To update the a specific submodule go to the submodules folder and run
the command:
```
git pull origin master
```

To update all submodules run the following command in the \dotfiles folder:
```
git submodule foreach git pull origin master
```

## Terminal features:

This section contains the user specified terminal features I have 
included in my basrc or bash_aliases files.

### Aliases:

This is a overview of the bash aliases that I have in my I have added a
short explanation of its use.

**ls commands**:
```
ll = 'ls -alF'
la = 'ls -A'
l  = 'ls -CF'
```

**git commands**:
```
g   = 'git'
gst = 'git status'
gad = 'git add'
gcm = 'git commit -m'
gp  = 'git push'
gd  = 'git diff'
```


**resize terminal commands**:

These commands are made to change the size of the terminal window.
The aliases are calls to functions defined in the bash_aliases file
that call the resize program.

- `st` : Small terminal, changes hight to 15 spaces
- `ot` : Ordinary terminal, change hight to 23 spaces
- `lt` : Large terminal, changes hight to 43 spaces
- `wt` : Wide terminal, changes width to 160 spaces
- `tt` : Thin terminal, changes width to 80 spaces

## Vim features

This section contains the user specified Vim features I have 
included in my vimrc file and in specific filetype setting files.

### General features:

This subsection contains the general features that can be used for all
Vim sessions.

**Key mappings:**

Toggle between split windows:
- ctrl + h : Left
- ctrl + n : Down
- ctrl + i : Up
- ctrl + l : Right

**IDE setup:**

I have made my own setup for Vim as and IDE where I use the following
plugins:
- MiniBufExplorer
- Tagbar
- NERDTree

![Alt text](https://github.com/kbjorke/dotfiles/blob/master/IDE_example.png 
"Example screenshot of personal IDE for vim. Shows python scripting.")

The IDE setting also makes the terminal window larger so that it can
be used effectivly for programming.

The setup is based on a function in the vimrc file called IDEFunc that 
calls the necessary commands for the enviroment to be set up.

To enact the setup use the command `:IDE` in Vim.

To go back to normal setup use the command `:Normal` in IDE mode.

### VIM-LaTeX suite features:

Customizations to the VIM-LaTeX suite are mainly done in the 
vim/ftplugin/tex.vim file, while some customizations are also done in the
vimrc file.

**Compilation:**

To compile the .tex file to a .pdf file inside the latex suite run the command
`\ (leader) + ll`. 

Compilation rules has been set to use the commands `latex`, `dvips` and `ps2pdf`
in succesion so that it first makes a .dvi file from the .tex file, then
a .ps file and then finally the .pdf file. In addition the compilation ignores
a number of warnings in order for the compilation to run smoothly.

**Viewing:**

In order to open a viewer to view the current document from insude the latex
suite run the command `\ (leader) + lv`. As I use it this opens the PDF 
document in the evince viewer.

No customization has been done to the viewing function.

**Templates:**

I have made a standard template named kb_standard.tex in the vim/templates
wich is activated when new .tex files are opened. The purpose of this 
template is to have a standard template that creates a header for the file
and includes what I uses in most of my latex files.

### Python scripting:

File specific setting for python .py scripts are primarily set in the
vim/ftplugin/python.vim file. Some setting may be set in the vimrc file,
but i prefere to keep all the file specific setting outside the general
vimrc file.

**Key mappings:**

`ctrl + p` : Runs the current python script.

**Templates:**

I have made a standard template named kb_standard.py in the vim/templates
wich is activated when new .py files are opened. The purpose of this 
template is to have a standard template that creates a header for the file
and import what I uses in most of my latex files.

### R scripting:

File specific setting for R .r scripts are primarily set in the
vim/ftplugin/r.vim file.

**Key mappings:**

`ctrl + p` : Runs the current R script using the `Rscript` program.
