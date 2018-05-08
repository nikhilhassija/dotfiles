setup_vim=true
setup_zsh=true
setup_tmux=true

if $setup_vim ; then
    if [[ test -d ~/.vim/bundle/Vundle.vim ]] ; then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    
    cp .vimrc ~/.vimrc
fi

if $setup_zsh ; then
    # Checking if oh-my-zsh is installed.
    if [[ test -d ~/.oh-my-zsh ]] ; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi

    test -d ~/.oh-my-zsh/custom/themes || mkdir ~/.oh-my-zsh/custom/themes;

    cp nikhil.zsh-theme ~/.oh-my-zsh/custom/themes
fi

if $setup_tmux ; then
    cp .tmux.conf ~/.tmux.conf
fi
