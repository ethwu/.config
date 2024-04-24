
# ls
alias ls='ls --color=auto -cp'
alias ll='ls -alhF'
alias la='ls -A'

# eza
if command -v eza &> /dev/null ; then
	alias ls='eza -bF --group-directories-first --colour-scale=all --smart-group'
	alias ll='ls -lah --git --git-repos'
	alias lg='ls -laGh --git --git-repos --no-time'
	alias lS='ls -lah --git --git-repos --total-size'
	alias tree='eza --tree'
	alias desc='ls -dlbhH@ --git'
fi

if command -v nvim &> /dev/null ; then
	alias vim=nvim
fi

if command -v just &> /dev/null ; then
	alias j=just
fi
