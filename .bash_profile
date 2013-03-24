# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

#######
### JOSH ROZNER
#######
# use sublime text
export EDITOR="/usr/local/bin/subl"

#look in current directory for executables
export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:."

#ruby stuff
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#allow quick change of directories
export CDPATH=.:~:~/Programming

# tab completion for git
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


#################
# Bash Settings #
#################

#simple colors
export CLICOLOR=1
#export TERM=xterm-color

##################
#### ALIASES #####
##################

# quick compile
alias comp="gcc -Wall -g3 -std=c99 -pedantic -o"

# quick ssh
alias zoo="ssh jsr24@node.zoo.cs.yale.edu"
alias zoox="ssh -X jsr24@node.zoo.cs.yale.edu"
alias cabj="ssh 152.74.238.49"		# agn server in chile
alias bull="ssh -t jsr24@bulldogj.wss.yale.edu ssh jsr24@ib040"
alias zooprdup="ssh jsr24@node.zoo.cs.yale.edu 'lpr -P zoo2 -o PageSize=Letter -o PageRegion=Letter -o InputSlot=Default -o Resolution=600dpi -o Duplex=DuplexNoTumble'" 

# quick access to local dirs
alias yale="cd /Users/jsrozner/Documents/a_Yale/2013_Spring"

# Git aliases
alias ga='git add'
alias gc='git commit'
alias gg='git'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gg='git grep'
alias gm='git merge'
alias gs='git status'
alias gs='git log'

# grep aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls aliases
alias l='ls -lA'

# rails aliases
alias rs='rails server'
alias rc='rails console'
alias ra='bundle exec rake assets:precompile'

##################
## MY FUNCTIONS ##
##################

# takes boolean; show or hide hidden files
showhid(){
	defaults write com.apple.finder AppleShowAllFiles $1
	killall Finder
}

# sshfs quick commands
mapzoo(){
	mapsshfs jsr24@node.zoo.cs.yale.edu: Zoo_mount Classes
}

#mapcabj(){
	#mapsshfs Cabj_mount
#}

mapbull(){
	mapsshfs jsr24@bulldogj.wss.yale.edu: Bull_mount 
}

# usage: dir to mount, where to mount, dir to cd to
# mounts if not already mounted
mapsshfs(){
	mount | grep $2 >& /dev/null || 
		sshfs -o follow_symlinks -o cache_timeout=1 $1 /Users/jsrozner/a_Mount/$2 && cd /Users/jsrozner/a_Mount/$2/$3
}

# safe sleep modifier
ss(){
	echo $1
	if [ "$1" -eq "1" ]; then
		echo "setting safesleep"
		sudo pmset -a hibernatemode 3
	else
		echo "disabling safesleep"
		sudo pmset -a hibernatemode 0
	fi
}