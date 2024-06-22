# dotfiles
These are my dotfiles

## Installation
If for some reason you want to use my dotfiles, you can do so using
[GNU Stow](https://www.gnu.org/software/stow/).

```sh
# install specific packages:
stow --dotfiles --target ~ <package> ...

# or install all at once
stow --dotfiles -t ~ $(echo */)
```
