# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="amuse"

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
  echo "$(cat ~/.README)"
  echo "---"
fi

# Suggest to install "brew"
if [ $(which brew 2>&1 >/dev/null; echo $?) -ne 0 ]; then
  export PATH=/opt/homebrew/bin:$PATH
fi

# Suggest to install "fzf"
if ! fzf_loc="$(which fzf)" || [[ -z $fzf_loc ]]; then
  echo "Consider install fzf for file fuzzy find!"
  echo "     run: apt-get install -y fzf"
  echo "  or run: brew install fzf"
fi

# In order for VCPKG to run on arm, s390x, and ppc64le platforms.
export VCPKG_FORCE_SYSTEM_BINARIES=1

# Android
export ANDROID_HOME=/Users/boyw165/Library/Android/sdk
export PATH=$PATH:/Users/boyw165/Library/Android/sdk/platform-tools
