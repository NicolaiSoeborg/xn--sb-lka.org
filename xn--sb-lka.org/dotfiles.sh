git clone --bare https://github.com/NicolaiSoeborg/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
locale-gen en_DK.UTF-8
source ~/.bash_aliases
dotfiles config --local status.showUntrackedFiles no
curl -fLso ${XDG_DATA_HOME:-~/.local/share}/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm  # tmux: prefix+I
