# Dotfiles

## System setup

Install required programs:

```bash
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty vim git curl zsh neovim tree htop bat exa ripgrep fd-find tmux
```

Install Node.js:

```bash
curl -sL install-node.now.sh | sudo bash
```

Git settings:

```bash
git config --global user.name "Kristian L. Bjørke"
git config --global user.email "kbjorke@gmail.com"
git config --global core.editor vim
```

Set ssh key:

```bash
ssh-keygen -t ed25519 -C "kbjorke@gmail.com"
eval "$(ssh-agent -s)"
ssh-add .ssh/id_ed25519
cat .ssh/id_ed25519.pub 
```

Enter ssh key-phrase into Github.com

## Install

Clone repository:

```bash
git clone git@github.com:kbjorke/dotfiles.git
```

Install/link dotfiles (installs submodule/plugins):

```bash
cd dotfiles/
./install
```
