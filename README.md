# Personal environment configuration

### vim
Install Vundle first from here: `https://github.com/gmarik/Vundle.vim`
Note: This might change
`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
Then call `PluginInstall`

### windows navigation
Install Compiz manager
`apt-get install compizconfig-settings-manager compiz-plugins-extra`

import compiz_config

### keyboard remapping
#### xmodmap
`xmodmap Xmodmap` for shift+[i,j,k,l] as arrow keys (vim style)
Tips: Add the command to .bashrc to make it permanent.

#### xkb
put `us` at `/usr/share/X11/xkb/symbols/`
Run `rm -r /var/lib/xkb/*`
Run `setxkbmap`

That's it.

