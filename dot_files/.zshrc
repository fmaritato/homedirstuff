#!/bin/zsh

##########################################
# Options
##########################################
setopt auto_list
setopt append_history
setopt bang_hist
setopt clobber
setopt complete_aliases
setopt notify
setopt No_Beep
bindkey -e

##########################################
# Aliases
##########################################
alias la='ls -a'
OSNAME=`uname -s`
if [ "$OSNAME" = "Darwin" -o "$OSNAME" = "FreeBSD" ]; then
  alias ls='ls -F'
else
  alias ls='ls -F --color=tty'
fi
alias findnosvn='find . -name .svn -prune -o -type f -print'
alias ll='ls -alF'
alias grep='grep -i'
alias listcp='echo $CLASSPATH | tr ":" "\n"'
alias listpath='echo $path | tr " " "\n"'
alias fu='ps -fu ${LOGNAME}'
alias vi=vim
alias fu='ps -fu $LOGNAME'
alias a2ps='a2ps --line-numbers=1 -E -d'
alias scpresume='rsync --partial --progress --rsh=ssh'

# Must provide port number
alias whohasmyport='/sbin/fuser -v -n tcp '
# Must provide host:port
alias whohasmyport2='/usr/sbin/lsof -i tcp@'

##########################################
# Functions
##########################################
function ensureSSHIdentity () {
  identity=`command ssh-add -l`
  result=$?

  if [[ $identity == "The agent has no identities." ]] ; then
    command ssh-add $HOME/.ssh/id_dsa
  fi
}
function ssh () {
  ensureSSHIdentity
  command ssh $*
}
function scp () {
  ensureSSHIdentity
  command scp $*
}
function cvs () {
  ensureSSHIdentity
  command cvs $*
}
function classpath() {
  for f in `ls $HOME/.m2/repository/**/*.jar`
  do
    CLASSPATH=$f:$CLASSPATH
  done
  export CLASSPATH
}
function switchjava() {
  version=$1
  echo $version
  if [ -d /usr/local/jdk${version} ]; then
    JAVA_HOME=/usr/local/jdk${version}
  elif [ -d /usr/java/jdk${version} ]; then
    JAVA_HOME=/usr/java/jdk${version}
  elif [ -d /usr/java/j2sdk${version} ]; then
    JAVA_HOME=/usr/java/j2sdk${version}
  else
    echo "JDK not found!"
    return
  fi
  JAVA_VERSION=$version
  JDK_HOME=$JAVA_HOME
  export JAVA_HOME
  export JDK_HOME
  export JAVA_VERSION
  PATH=$JAVA_HOME/bin:$PATH
  export PATH
  echo JAVA_HOME: $JAVA_HOME
}

##########################################
# Other options
##########################################
fignore=(.o CVS .class)  # Don't file complete on these extensions.
HISTFILE=~/.history      # History file
SAVEHIST=10000           # 
HISTSIZE=10000           # How many commands to remember

# Override defaults so ls colors are readable
# di is for directories; 01 use brighter colors; 33 is yellow
export LS_COLORS='di=01;33:*.bz2=01;31:*.Z=01;31:*.gz=01;31:*.zip=01;31'

# Automagically start less case-insensitive and clear screen.
export LESS="-Ic"

umask 022

# Set the time zone to pacific.
export TZ=PST8PDT

export EDITOR=vim
export VISUAL=vim
export PAGER=less

export PATH=$HOME/bin:$PATH:/sbin:/usr/sbin:/usr/local/bin:/opt/local/bin:/home/t/bin
if [ "x$YROOT_NAME" != "x" ]; then
  export PROMPT="[$YROOT_NAME]-%{%}%m/%n %% "
else
  export PROMPT="%{%}%m/%n %% "
fi

# Set the title for xterms
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

export JAD_OPTIONS="-s .java -b -ff -nonlb -o -f"
export INTELLIJ_HOME=/usr/local/idea

export JAVA_VERSION=1.6
if [ "$OSNAME" = "Darwin" -a -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
else
  export JAVA_HOME=/usr/local/jdk${JAVA_VERSION}
fi

if [ ! -d $JAVA_HOME ]; then
  if [ -d /usr/java/jdk${JAVA_VERSION} ]; then
    export JAVA_HOME=/usr/java/jdk${JAVA_VERSION}
  elif [ -d /usr/local/java ]; then
    export JAVA_HOME=/usr/local/java
  elif [ -d /usr/java/latest ]; then
    # CentOS rpm install
    export JAVA_HOME=/usr/java/latest
  else
    echo "Cannot find JAVA_HOME."
    unset JAVA_HOME
  fi
fi
echo "JAVA_HOME set to $JAVA_HOME"

# Maven home directory
if [ -e /usr/share/maven ]; then
  export M2_HOME=/usr/share/maven
else
  export M2_HOME=/usr/local/maven
fi
export PATH=\
:$JAVA_HOME/bin\
:$INTELLIJ_HOME/bin\
:$M2_HOME/bin\
:$PATH

###########################################################
# complete hostnames out of ssh's ~/.ssh/known_hosts
autoload -U compinit; compinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' users resolve
zstyle ':completion:*' _init_d on
hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*})
zstyle ':completion:*:hosts' hosts $hosts

# For stupid intellij. Make sure to use an updated JDK so debugging isn't
# as painful.
export JDK_HOME=$JAVA_HOME
export IDEA_VM_OPTIONS="$HOME/.ideaVmOptions"

export PERLV=5.8
PERL5LIB=\
/home/t/lib/perl5:\
/home/t/lib/perl5/site_perl
export PERL5LIB


# export MAVEN_OPTS="-agentlib:jprofilerti=port=8849 -Xbootclasspath/a:/usr/local/jprofiler5.2.4/bin/agent.jar"
# ANT
if [ -d /usr/local/ant ] ; then
  export ANT_HOME=/usr/local/ant
  export PATH=$ANT_HOME/bin:$PATH
fi

export NLS_LANG=AMERICAN_AMERICA.ZHS16CGB231280

# Thanks MacOSX. Default Java charset is MacRoman, this overrides that.
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"

