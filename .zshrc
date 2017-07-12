# Path to your oh-my-zsh installation.
  export ZSH=/home/shane/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"
ZSH_THEME="shane-custom"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git wd chucknorris rand-quote archlinux per-directory-history)
# for per-directory-history, switch between local and global command history
# using ctrl+g keybinding
# # dir-history enables directory movement w/ alt+left, right

   # archlinux

   # Maintainer: Benjamin Boudreau

   # Enabled aliases for pacman (replace pac by ya for yaourt)

   # Alias   Description
   # pacin   Install specific package(s) from the repositories
   # pacins  Install specific package not from the repositories but from a file
   # pacre   Remove the specified package(s), retaining its configuration(s) and required dependencies
   # pacrem  Remove the specified package(s), its configuration(s) and unneeded dependencies
   # pacrep  Display information about a given package in the repositories
   # pacreps Search for package(s) in the repositories
   # pacloc  Display information about a given package in the local database
   # paclocs Search for package(s) in the local database
   # pacupd  Update and refresh the local package and ABS databases against repositories
   # pacupg  Update the local database and upgrade packages
   # pacinsd Install given package(s) as dependencies of another package
   # pacmir  Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
   # Function    Description
   # paclist List all installed packages with a short description - Source
   # paclsorphans    List all orphaned packages
   # pacrmorphans    Delete all orphaned packages
   # pacdisowned | less +F   List all disowned files in your system


# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/microchip/mplabx/v3.55/mplab_ide/bin
"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# RubyGems path
# PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# add user-made binaries to path
export PATH="$HOME/bin:$PATH"


# Run the following commands upon login

# echo '\n'; chuck | cowsay;echo '\n'

if [ $((1 + RANDOM % 10)) = 7 ]; then
    chuck | cowsay;echo '\n'
fi

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# disable software flow control (locks VIM when ctrl-s is sent (XOFF))
# note: press ctrl-q (XON) to resume should this be disabled
stty -ixon

# tmux

# annoyingly, I can't get ~/.Xinitrc to work correctly, so I am adding the
# command to remap caps and ctrl here instead
# xmodmap ~/.Xmodmap

# colored man pages!!!
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias lock=". ~/scripts/lock.sh"
alias lockme="lock -pt \"`chuck | fold -w 80 -s`\n\n`date | awk '{print $1\" \"$2\" \"$3}'` - Shane Ryan's ThinkPad\" -f Anonymous-Pro-Bold-for-Powerline"
alias cpp="g++ -Wall -Werror -Wextra"
alias vpn="cat ~/.passfile | sudo openconnect vpnaccess.nd.edu -u sryan8 --passwd-on-stdin"
alias mountRO="mount -t ntfs -o uhelper=udisks2,nodev,nosuid,uid=1000,gid=1000 /dev/sda2 /run/media/shane/46E4D51AE4D50D55"
# The following is used to fire up IPython prompt according to the current
# python used in a virtualenv
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
# alias remote='vpn &;ssh sryan8@remote101.helios.nd.edu'
# the above needs to be fixed... want to:  connects to the vpn, sends the process to the background,
# and then uses ssh to login to an appropriate campus machine.
alias remote="ssh sryan8@remote101.helios.nd.edu"
alias student="ssh sryan8@student00.cse.nd.edu"
# more alias stuffz
alias g="grep"
alias ls="ls --color=auto"

# start a tmux shell with login
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi


