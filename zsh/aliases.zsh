
if command -v eza > /dev/null ; then
	alias eza='eza -bF --group-directories-first --smart-group'
	alias ls=eza
	alias ll='eza -lah --git --git-repos'
	alias lg='eza -laGh --git --git-repos --no-time'
	alias lS='eza -lah --git --git-repos --total-size'
	alias tree='eza --tree'
	alias desc='eza -dlbhH@ --git'
fi

