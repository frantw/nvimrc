# nvimrc

Personal init.vim configuration file for neovim, conditionally activate plugins for [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim).

## Getting Started

### Install Neovim (using homebrew)
```
brew install neovim
```

### Install vim-plug
```
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
``` 

### Bootstrap configuration file
```
git clone https://github.com/frantw/nvimrc
cd nvimrc
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim
nvim -c PlugInstall -c q -c q
nvim -c UpdateRemotePlugins -c q -c q
```

### Fix VSCode configuration
```
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

To learn more about [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim), just take a look at the documentation.

## Plugs
- [easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion): Vim motions on speed!
- [asvetliakov/vim-easymotion](https://github.com/asvetliakov/vim-easymotion): fork of vim-easymotion to use with vscode-neovim extension
- [tpope/vim-surround](https://github.com/tpope/vim-surround): provides mappings to easily delete, change and add such surroundings in pairs.
- [tpope/vim-repeat](https://github.com/tpope/vim-repeat): enable repeating supported plugin maps with "."
