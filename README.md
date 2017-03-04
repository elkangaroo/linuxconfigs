linuxconfigs
============

Just some config files.

## Requirements
- GIT 1.8.0+ (for GIT < 1.8 see Compatibility below)
- TMUX 1.9+

## Install/ Update
```shell
$ ./dot.sh
$ ./dot.sh --update
```

Create ~/.gitconfig.local with the following content (your git username and email):
```
[user]
  name = <yourname>
  email = <youremail>
```

## Compatibility
For GIT 1.7.* and older additionally run the following command:
```shell
$ git config --global push.default matching
```
