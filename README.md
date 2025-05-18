# dotfiles

## Description

My dotfiles for test Environment(Ubuntu 24.04 LTS). They may be update periodically.

## Installation


### install nix

use [DeterminateSystems/nix-installer](https://github.com/DeterminateSystems/nix-installer) to install nix.

```bash
$ curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate
echo ". /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" >> ~/.bashrc
source ~/.bashrc
```

### clone this repo

```bash
$ git clone git@github.com:wipeseals/dotfiles.testenv.git ~/dotfiles
```

### install home-manager

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
$ nix-shell '<home-manager>' -A install

$ rm -r ~/.config/home-manager
$ ln -s ~/dotfiles/.config/home-manager ~/.config/
$ home-manager switch
```

### change default shell

home manager には default shell を変更するオプションがないので、手動で変更する必要がある。
`.bashrc` に適用されたいくつかの環境設定・Scriptを引き継ぎたいので、.bashrc 末尾で fishを呼び出すようにしている。

```bash
$ echo "fish" >> ~/.bashrc
```