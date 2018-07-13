# dotfiles

Repository for storing and sharing my configuration files and commonly used scripts

## Useful utils/programs 

* rdkit on server: mwojcichowski channel
* openbabel on server: 
    *  clone repo
    *  export CXX and CC
    * -DCMAKE_INSTALL_PREFIX:PATH
    * -DPYTHON_BINDINS -DRUN_SWIG

## OSX configuration

* tmux (might require https://gist.github.com/shawnbot/3277580)
* iterm (add escape+b to profiles/keyboards for CMD + arrow for word jump)
* spectacle (free)
* http://inkmarkapp.com/markdown-quick-look-plugin-mac-os-x/ (space bar)

## Misc

* strings /lib64/libc.so.6 | grep GLIBC

* /etc/hosts

```
10.0.5.1 truten
10.0.4.1 nosal
10.0.9.1 trzmiel
```

* default token in jupyter via http://jupyter-notebook.readthedocs.io/en/latest/config.html
* sshuttle for VPN to VPN-lacking networks
* public notebook for easy access

## Useful cmds

* find . -name 'cxcalc*' -exec mv -t tmp/ {} +
