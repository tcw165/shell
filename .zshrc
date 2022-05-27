# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  history
  zsh-autosuggestions
  copyfile
  copypath
  dirhistory
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Print README
if [ -f ~/.README ]; then
  cat ~/.README
fi

# In order for VCPKG to run on arm, s390x, and ppc64le platforms.
export VCPKG_FORCE_SYSTEM_BINARIES=1
