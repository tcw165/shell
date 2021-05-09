# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/$(whoami)/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell-with-hg"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which ggins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
ZSH_AUTOSUGGEST_STRATEGY=(buck history completion match_prev_cmd)
plugins=(git brew zsh-autosuggestions)
# Make sure to install these plugins:
# - git
# - brew
# - zsh-autosuggestions, https://github.com/zsh-users/zsh-autosuggestions

source $ZSH/oh-my-zsh.sh

# Facebook mercurial (hg) prompt script
if [ -f /opt/facebook/hg/share/scm-prompt ]; then
  source /opt/facebook/hg/share/scm-prompt
fi

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# Use LLVM as default.
export CC=/usr/local/opt/llvm/bin/clang
export CXX=/usr/local/opt/llvm/bin/clang++

# General PATH lookup
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# export TERM=xterm-256color

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Use code comment to open file in VisualStudioCode.
# function code() {
#     if [[ $# = 0 ]]
#     then
#         open -a "Visual Studio Code"
#     else
#         local argPath="$1"
#         [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
#         # open -a "Visual Studio Code" "$argPath"
#         open -a "Visual Studio Code" "$@"
#     fi
# }
# export EDITOR="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"

#Update environment variables.
function updateEnvDependantVars() {
    export DYLD_FALLBACK_LIBRARY_PATH=`python-config --prefix`/lib:/usr/local/cuda/lib:/usr/local/lib:/usr/lib
}

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# BASH
alias refresh='source ~/.zshrc'

# Hyper (GUI terminal)
alias termsettings='code ~/.hyper.js'

# Files/directory navigation.
alias cdev='cd ~/Development'
alias f="find . -name"
alias g="grep -r \"$@\" ."
# alias g="echo $1"

# Mercurial (hg) diffs
alias hgdiff="hg diff -r bottom^ -r ."

# C/C++
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export CMAKE_PREFIX_PATH="/usr/local/Cellar/opencv/4.3.0_2:/Users/tc/Qt5.14.2/5.14.2/clang_64/lib/cmake"

# Java version
function diagnose_java_env() {
    alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8 2>/dev/null`; java -version"
    alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11 2>/dev/null`; java -version"
    alias j14="export JAVA_HOME=`/usr/libexec/java_home -v 14 2>/dev/null`; java -version"
    # Default global Java version
    echo "Scanning the JDKs installed on this device..."
    /usr/libexec/java_home -V
    echo "---"
}
function activate_android_jdk() {
    export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home/
}
diagnose_java_env
# activate_android_jdk # Facebook buck doesn't use JDK from AS.
# Android
alias show_fg_activity='adb shell dumpsys activity activities | grep mResumedActivity'

# Python
alias venv='source venv/bin/activate'
alias pynb='jupyter notebook'
alias pypath='python -c "import sys; print sys.path;"'
# Python env
# eval "$(pyenv init -)"
 # Run Python conda env diagnosis.
function diagnose_conda_env() {
    echo "Scanning your conda env...";
    /usr/local/anaconda3/bin/conda env list 2>/dev/null;
    if [ $? -eq 0 ]; then
        export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize # Require anaconda
        echo "Use \"conda activate your_env\" to activate the right environment for development!";
        echo "---"
    else
        echo "Anaconda isn't installed, and you may want to install it later. :)";
        echo "---"
    fi
}
function activate_default_cond_env() {
    echo "Activating default conda env..."
    conda --version >/dev/null 2>&1;
    if [ $? -eq 0 ]; then
        source activate
        conda activate py38 # Require py38 env, conda create -n py38 python=3.8 anaconda
        echo "---"
    fi
}
# diagnose_conda_env
# activate_default_cond_env

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
# Ruby extension: colorls (https://github.com/athityakumar/colorls)
# source $(dirname $(gem which colorls))/tab_complete.sh

# git:
alias gwip='git commit -am "wip."'

# Mongodb:
alias start_mongodb='brew services start mongodb'
alias stop_mongodb='brew services stop mongodb'
alias restart_mongodb='brew services restart mongodb'
alias clean_mongodb='rm -rf /usr/local/var/mongodb/ && mkdir /usr/local/var/mongodb/'

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# ZSH NVM completion plugin, https://github.com/lukechilds/zsh-nvm#manually
[ -s "~/.zsh-nvm/zsh-nvm.plugin.zsh" ] && source ~/.zsh-nvm/zsh-nvm.plugin.zsh

# Misc.:
alias watch_ps='watch -n1 ps'

# For stupid ipython.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# NDK
# android studio version
# export ANDROID="/Users/$USER/Library/Android/sdk/"
# export ANDROID_HOME="/Users/$USER/Library/Android/sdk/"
# export ANDROID_NDK="/Users/$USER/Library/Android/sdk/ndk-bundle"
# export ANDROID_NDK_HOME="/Users/$USER/Library/Android/sdk/ndk-bundle"
# export ANDROID_CMAKE="/Users/$USER/Library/Android/sdk/cmake/3.6.3155560/bin/cmake"
# export ANDROID_HVPROTO=ddm
# export PATH="$PATH:$ANDROID_HOME/platform-tools"
# homebrew version
# export ANDROID_HOME="/usr/local/opt/android-sdk"
# export NDK_HOME="/usr/local/Cellar/android-ndk-r10e/r10e"

# Bintray and JCenter Deployment.
# export BINTRAY_USER="boyw165"
# export BINTRAY_API_KEY="5114c60e291c55cb67962adf765cd8d2b06459dc"
# export JITPACK_API_KEY="jp_a429e25o3jun6tsajl5tjtbpar"
# export GITHUB_USER="boyw165"
# export GITHUB_API_KEY="d4e1ee8431dd529d18d11c9bd009933d69255ac1"
# export GITHUB_API_TOKEN=${GITHUB_API_KEY}
# export FABRIC_API_KEY="899dcee9306ec461449140c2bcf50da976c36991"
# export FABRIC_API_SECRET="79b392c2c1bd297d1afc9fc983822a9023a2542489522791907b686a92e649f2"
# export BINTRAY_CBLUE_USER="cblue"
# export BINTRAY_CBLUE_API_KEY="664a31d896ae5469ae5c13b866c334d587ebb9df"
# export BINTRAY_SO_USER="deploy-sodalabs"
# export BINTRAY_SO_API_KEY="8840ce38d0dad3347314ea3732e91a9ff8fd8721"
# export JITPACK_CI_TOKEN="jp_1bthfr0cqrtp31r7v7d9ncioci"
# export JITPACK_SO_API_KEY=${JITPACK_CI_TOKEN}

# added by setup_fb4a.sh
export ANDROID_SDK=/opt/android_sdk
export ANDROID_NDK_REPOSITORY=/opt/android_ndk
export ANDROID_HOME=${ANDROID_SDK}
export PATH=${PATH}:${ANDROID_SDK}/emulator:${ANDROID_SDK}/tools:${ANDROID_SDK}/tools/bin:${ANDROID_SDK}/platform-tools
