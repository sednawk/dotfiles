export WORKON_HOME="$HOME/.virtualenvs" 
setopt interactivecomments

#plugins
plugins=(git github git-extras git gem encode64 docker debian common-aliases lol nyan pip pyenv sublime sudo tmux urltools web-search wd catimg)

# basic
export BROWSER="firefox"
export EDITOR="vim"
export GPG_AGENT_INFO="/home/sed/.gnupg/S.gpg-agent:3186:1"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export INTEL_BATCH=1
export MAIL="~/.mail"
export PATH=${PATH}:/usr/local/bin:/home/sed/bin
export VISUAL=$EDITOR
export PATH="/usr/local/bin:$PATH"

# aliases
alias 4chan="python /opt/4chan/4chan-thread-archiver"
alias scrape="python /opt/scrape/imagescraper.py"
alias screenrec='byzanz-record -w 1920 -h 1080 -v byzanz-$(date "+%Y-%m-%d_%H-%M").webm'

alias down="aria2c"
alias download="aria2c"

alias upload="pastebin -p --paste-private --paste-expire-date=10M -f"
alias paste="pastebin -p --paste-private --paste-expire-date=10M" 

alias pgrep="pgrep -l"
alias pw='pwgen -sy1 20 10'
alias screen="screen -U"
alias vi="vim"

alias lsa='ls -al'
alias lsd='ls -al | grep "^d"'
alias rezsh='. ~/.zshrc'

alias -s doc="catdoc"
alias -s pdf="zathura"
alias -s txt=$EDITOR
alias -s xcf="gimp"
alias -s img="eog"
alias -s {html,php,com,net,org,gov}=$BROWSER
alias -s {jpg,jpeg,png,gif}="feh --scale-down"
alias -s {mp3,ogg,wav,flac}="mplayer"
alias -s {mpg,mpeg,avi,ogm,wmv,m4v,mp4,mov,mkv}="mplayer"

alias iecurl="curl -H \"User-Agent: Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)\""
alias ffcurl="curl -H \"User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.8) Gecko/2009032609 Firefox/3.0.0 (.NET CLR 3.5.30729)\""

alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"
alias pypath='python -c "import sys; print sys.path" | tr "," "\n" | grep -v "egg"'
alias pycclean='find . -name "*.pyc" -exec rm {} \;'
alias nethack='telnet nethack.alt.org'

alias g=git
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gl='git pull'
alias gp='git push'
alias gst='git status -sb'
alias gsd='git svn dcommit'
alias gsr='git svn rebase'
alias gs='git stash'
alias gsa='git stash apply'
alias gr='git stash && git svn rebase && git svn dcommit && git stash pop' # git refresh
alias gd='git diff | $GIT_EDITOR -'
alias gmv='git mv'
alias gho='$(git remote -v 2> /dev/null | grep github | sed -e "s/.*git\:\/\/\([a-z]\.\)*/\1/" -e "s/\.git$//g" -e "s/.*@\(.*\)$/\1/g" | tr ":" "/" | tr -d "\011" | sed -e "s/^/open http:\/\//g")'

# HG ALIASES
alias hgst='hg status'
alias hgd='hg diff | $GIT_EDITOR -'
alias hgo='hg outgoing'

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


#ZSH_THEME="afowler"
ZSH_THEME="bureau"

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

# gay shit
alias fucking="sudo"
umask 077
alias die='echo "RIP..."; shred -n 200 -z -u '
unset HISTFILE SAVEHIST TMOUT PROMPT_COMMAND
alias pulse="pavucontrol"
autoload -U tetris
zle -N tetris
bindkey ^T tetris

function authme {
  ssh $@ 'cat >>.ssh/authorized_keys' < ~/.ssh/id_rsa.pub
}

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.rar)            unrar x $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unzip $1          ;;
            *.Z)              uncompress $1     ;;
            *)                echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

dict() {
    grep "$@" /usr/share/dict/words
}

dls () {
 # directory LS
 echo `ls -l | grep "^d" | awk '{ print $9 }' | tr -d "/"`
}

dgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    grep -iR "$@" * | grep -v "Binary"
}

dfgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    # and returns only unique filenames
    grep -iR "$@" * | grep -v "Binary" | sed 's/:/ /g' | awk '{ print $1 }' | sort | uniq
}

psgrep() {
    if [ ! -z $1 ] ; then
        echo "Grepping for processes matching $1..."
        ps aux | grep $1 | grep -v grep
    else
        echo "!! Need name to grep for"
    fi
}

killit() {
    # Kills any process that matches a regexp passed to it
    ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

exip () {
    # gather external ip address
    echo -n "Current External IP: "
    curl wtfismyip.com/text
}

ips () {
    # determine local IP address
    ifconfig | grep "inet " | awk '{ print $2 }'
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

transfer() { curl --upload-file $1 https://transfer.sh/$(basename $1); } 
alias transfer=transfer
	
source /home/sed/.venvburrito/startup.sh

alias l="ls"
alias ll="ls -lah"
                  
