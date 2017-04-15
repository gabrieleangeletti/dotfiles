# Create symlinks between dotfiles/ and home directory
cd ~

# remove older config
rm -r .oh-my-zsh
rm -r .vim
rm .vimrc
rm .zshrc

# zsh
ln -s ./dotfiles/.oh-my-zsh .oh-my-zsh
ln -s ./dotfiles/.zshrc .zshrc

# vim
ln -s ./dotfiles/.vim .vim
ln -s ./dotfiles/.vimrc .vimrc
