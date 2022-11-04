# Dotfiles

## System setup

Install required programs:

```bash
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty vim git curl zsh tree htop bat exa ripgrep fd-find fzf tmux gcc python3-pip
sudo snap install nvim --classic
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

Install/update tmux plugins (in tmux session):
```bash
prefix + I
```

## Inspiration

- https://github.com/ctaylo21/jarvis
	- https://www.freecodecamp.org/news/coding-like-a-hacker-in-the-terminal-79e22954968e
	- https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/
- https://github.com/davidmytton/dotfiles
	- https://console.dev/articles/neovim-best-code-editor-ide-for-developers/

## Tools and significant plugins

- Dotbot: https://github.com/anishathalye/dotbot/tree/d2f76a25933f97cd37ef94e3bf9c134b9c55a02a
- Alacritty: https://github.com/alacritty/alacritty
	- alacritty-themes: https://github.com/rajasegar/alacritty-themes
- Zsh: https://www.zsh.org/
	- Plugin manager (antigen): https://github.com/zsh-users/antigen
	- Oh My Zsh: https://github.com/ohmyzsh/ohmyzsh
	- Powerlevel10k: https://github.com/romkatv/powerlevel10k
	- https://github.com/zsh-users/zsh-syntax-highlighting
	- https://github.com/zsh-users/zsh-autosuggestions
	- https://github.com/agkozak/zsh-z
- Tmux: https://github.com/tmux/tmux
	- Plugin manager (tpm): https://github.com/tmux-plugins/tpm
	- https://github.com/tmux-plugins/tmux-resurrect
	- https://github.com/tmux-plugins/tmux-continuum
	- https://github.com/tmux-plugins/tmux-cpu
	- https://github.com/tmux-plugins/tmux-battery
- Neovim: https://github.com/neovim/neovim
	- Plugin manager (vim-plug): https://github.com/junegunn/vim-plug
	- Airline: https://github.com/vim-airline/vim-airline
	- Coc.nvim: https://github.com/neoclide/coc.nvim
	- Telescope: https://github.com/nvim-telescope/telescope.nvim
