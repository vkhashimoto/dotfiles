# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#bold='\['`tput bold`'\]'        ; [ $bold = '\[\]' ] && bold=
#PS1='\e[1;32m[\t]\e[m - $(tput bold)\w$(tput sgr0)\n\W'
#PS1='\e[4;36m[\t]\e[m - \e[1;79m\w\e[m \n\e[1;32m\W\e[m \$ '





# function parse_git_dirty {
#   [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
# }
# function parse_git_branch {
# #   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
#     # git branch 2>/dev/null | sed -n -e 's/^\* \(.*\)/\1/p'
#     git_branch="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"
#     branch_name="${git_branch}"
#     # BRANCH_COLOR="\033[1;91m"
#     if [ "$branch_name" != "" ];
#     then
#         # if [[ "$branch_name" = *"master"* ]];
#         # then
#         #     BRANCH_COLOR="\033[5;1;91m"
#         # fi
#         branch_name="($branch_name) "
        
#     fi
    
#     echo "$branch_name"
# }

# # function get_color_by_branch {
# #     git_branch="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"
# #     branch_name="${git_branch}"
# #     BRANCH_COLOR="\033[1;91m"
# #     if [ "$branch_name" != "" ];
# #     then
# #         if [[ "$branch_name" = *"master"* ]];
# #         then
# #             BRANCH_COLOR="\033[5;1;91m"
# #         fi
# #         branch_name="($branch_name) "
        
# #     fi
    
# #     echo "$BRANCH_COLOR"
# # }

# # echo $git_branch

# # # COLOR_RESET="\033[0m"
# # # BRANCH_COLOR="\033[5;1;91m"
# # normal_color='$(tput sgr0)'
# # pwd_basefolder='$(tput sgr 0 1)$(tput setaf 002 1)'

# # PS1="\[\e[4;36m\][\t]\[\e[m\] - \[$(tput setaf 243)\]\w\[$normal_color\]\n\$(get_color_by_branch)\$(parse_git_branch)\[$COLOR_RESET\]\[$pwd_basefolder\]\W\[$normal_color\]\[\e[m\] \$ "
# # BRANCH_COLOR="\033[5;1;91m"
# # function set_prompt_vars {
# #     bn="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"
# #     bn="${bn}"
# #     if [ "$bn" != "" ];
# #     then
# #         if [[ "$bn" = *"master"* ]];
# #         then
# #             BRANCH_COLOR="\033[5;1;91m"
# #         else
# #             BRANCH_COLOR="\033[1;91m"
# #         fi
# #         bn="($bn) "
# #     fi
# # }
# # PROMPT_COMMAND=set_prompt_vars
# # PS1="\[\e[4;36m\][\t]\[\e[m\] - \[$(tput setaf 243)\]\w\[$normal_color\]\n${bn:+ $bn}\[$COLOR_RESET\]\[$pwd_basefolder\]\W\[$normal_color\]\[\e[m\] \$ "

set_prompt_vars() {
    gb=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
    if [ "$gb" != "" ];
    then
        if [[ "$gb" = *"master"* ]];
        then
            BRANCH_COLOR='\033[3;5;1;91m'
        elif [[ "$gb" = *"release"* ]];
        then
            BRANCH_COLOR='\033[1;31m'
        else
            BRANCH_COLOR='\033[1;1;32m'
        fi
        gb="($gb)"
    fi
}
PROMPT_COMMAND=set_prompt_vars

COLOR_RESET='\033[0m'
COLOR_CLOCK='\e[4;36m'
COLOR_PWD='\e[0;2m'
COLOR_FOLDER='\e[0;32m'

normal_color='$(tput sgr0)'
pwd_basefolder='$(tput sgr 0 1)$(tput setaf 002 1)'

#when 'ls' is used, the folders will be displayed in green (97)
# LS_COLORS=$LS_COLORS:'di=0;32'; export LS_COLORS

# PS1='┌─\[$(echo -e $COLOR_CLOCK)\][\t]\[$(echo -e $COLOR_RESET)\]─[\[$(echo -e $COLOR_PWD)\]\w\[$(echo -e $COLOR_RESET)\]]\n├${gb:+\[$(echo -e $BRANCH_COLOR)\]$gb\[$(echo -e $COLOR_RESET)\]─}\[$(echo -e $COLOR_FOLDER)\][\W]\[$(echo -e $COLOR_RESET)\]\n└╼\$ '
# PS1='\[$(echo -e $COLOR_CLOCK)\][\t]\[$(echo -e $COLOR_RESET)\] - \[$(echo -e $COLOR_PWD)\]\w\[$(echo -e $COLOR_RESET)\]\n${gb:+\[$(echo -e $BRANCH_COLOR)\]$gb}\[$(echo -e $COLOR_RESET)\]\[$(echo -e $COLOR_FOLDER)\][\W]\[$(echo -e $COLOR_RESET)\] \$ '

#only git branch
PS1='┌─\[$(echo -e $COLOR_CLOCK)\][\t]\[$(echo -e $COLOR_RESET)\]─[\[$(echo -e $COLOR_PWD)\]\w\[$(echo -e $COLOR_RESET)\]]\n├${gb:+\[$(echo -e $BRANCH_COLOR)\]$gb\[$(echo -e $COLOR_RESET)\]─}\[$(echo -e $COLOR_FOLDER)\][\W]\[$(echo -e $COLOR_RESET)\]\n└▶\$ '

# git branch and eb environment
# PS1='┌─\[$(echo -e $COLOR_CLOCK)\][\t]\[$(echo -e $COLOR_RESET)\]─[\[$(echo -e $COLOR_PWD)\]\w\[$(echo -e $COLOR_RESET)\]]\n├${gb:+\[$(echo -e $BRANCH_COLOR)\]$gb\[$(echo -e $COLOR_RESET)\]─}\[$(echo -e $COLOR_FOLDER)\][\W]\[$(echo -e $COLOR_RESET)\]${ebEnv:+─\[$(echo -e $EB_COLOR)\]$ebEnv\[$(echo -e $COLOR_RESET)\]}\n└▶\$ '

PS2='╼▶ '
function sbash() {
    source $HOME/.bashrc
}

function sonar() {
    mvn clean test sonar:sonar -Dsonar.host.url=http://0.0.0.0:9002 -Dsonar.login=3b99b9ab7a28c25f56685b50f98ae1ba1951f01d
}

function gcp() {
    git fetch && git checkout $1 && git pull
}

function gs() {
    git status
}

function gd() {
    git diff $1
}

function gl() {
    git log --oneline
}

#This function opens java file with vim to quick edit, based on git diff
function ed() {
    vim $(find . -name "$1.java")
}

function ec2() {
    sh $HOME/.ssh/con.sh $(xclip -o)
}

mt() {
    if [ -f mvnw ]; then
        if [ -z $1 ]; then
            echo "TCHAU"  
        else
            echo "OI"
            # TEST_FOLDER=$(find . -type d -name test -print)
            # # TEST_FILE=$(find $TEST_FOLDER -type f -name *$1* -print)
            # readarray FILES < <(find $TEST_FOLDER -type f -name *$1*)
            # for i in "${FILES[@]}"
            # do
            #     echo $i
            # done
            # mvn test -Dtest=$(basename "$FILES")
        fi
    else
        echo "The current directory is not a valid maven project"
    fi
        # find . -type d -name "test" | while read line; do
        #     $TEST_FOLDER="$line"
        # done
        # echo $TEST_FOLDER
}

_mt_complete() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    TEST_FOLDER=$(find . -type d -name test -print)
    readarray FILES < <(find $TEST_FOLDER -type f -name $cur* -exec basename \{} .java \;)
    COMPREPLY=( $(compgen -W "$FILES" -- $cur))
}

complete -F _mt_complete mt

# our handler that returns choices by populating Bash array COMPREPLY
# (filtered by the currently entered word ($2) via compgen builtin)
_gcp_complete() {
    branches=$(git branch -l | cut -c3-)
    COMPREPLY=($(compgen -W "$branches" -- "$2"))
}

# we now register our handler to provide completion hints for the "gitpull" command
complete -F _gcp_complete gcp

function mcp() {
    mvn clean package
}


#git autocomplete on tab
source /usr/share/bash-completion/completions/git

#cd without cd
shopt -s autocd

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.local/bin
export GOPATH=$HOME/Documents/projetos/golang

#sqlcmd
export PATH=$PATH:/opt/mssql-tools/bin

export GTK_IM_MODULE=ibus

alias mvn11="JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64 && mvn"
