# Personal environment configuration

### vim

Install Vundle first from here: `https://github.com/gmarik/Vundle.vim`

Note: This might change

`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

Then call `PluginInstall`

`ln -s .vimrc ../.vimrc`

### windows navigation

Install Compiz manager

`apt-get install compizconfig-settings-manager compiz-plugins-extra`

import compiz_config

### keyboard remapping

put `us` at `/usr/share/X11/xkb/symbols/`

Run `rm -r /var/lib/xkb/*`

Run `setxkbmap`

That's it.

