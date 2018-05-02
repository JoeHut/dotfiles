# Path to your oh-my-zsh installation.
  export ZSH=/home/joe/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, npm)

# User configuration
#
# Exports {{{
export GOPATH="/home/joe/code/proglove/go:/home/joe/code/personal/go:/home/joe/code/playground/go"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/joe/code/proglove/go/bin:/home/joe/code/personal/go/bin:/home/joe/.gem/ruby/2.4.0/bin"

export LANG=en_US.UTF-8
export VISUAL="vim"
export EDITOR="vim"
export TERM=xterm

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

export MANPAGER="less -X"

export ZEPHYR_SDK_INSTALL_DIR=/home/joe/code/proglove/embed/zephyr-sdk
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_GCC_VARIANT=zephyr

export ZEPHYR_BASE=/home/joe/code/proglove/embed/zephyr

export CPPUTEST_HOME=~/tools/cpputest-3.8
export NVM_DIR="/home/joe/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#}}}

# Tmux {{{
function tmuxopen() {
	tmux attach -t $1
}
function tmuxnew() {
	tmux new -s $1
}
function tmuxkill() {
	tmux kill-session -t $1
}
# }}}






source $ZSH/oh-my-zsh.sh


# Alias' {{{
alias vi="vim"
alias tat='tmux new-session -As $(basename "$PWD" | tr . -)' # attach if session exits, else create new one.
alias tmuxsrc='tmux source-file ~/.tmux.conf'
alias tmuxkillall="tmux ls | cut -d : -f 1 | xargs -I {} tmux kill-session -t {}" # tmux kill all sessions.
alias ct="ctags -R --exclude=.git --exclude=node_modules"
alias cdev="cd /home/joe/code/proglove/clang"
alias godev="cd /home/joe/code/proglove/go/src"
alias jsdev="cd /home/joe/code/proglove/js"
alias mbd="cd /home/joe/code/proglove/embed"
alias gco="git checkout"
alias gst="git status -u"
alias gci="git commit"
alias gbr="git branch"
alias tiga="tig --all"
# }}}




source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# added by travis gem
[ -f /home/joe/.travis/travis.sh ] && source /home/joe/.travis/travis.sh
