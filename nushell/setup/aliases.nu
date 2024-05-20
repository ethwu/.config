
alias j = just

alias vim = nvim
# Use `nvim` if it's available.
if (which nvim | is-not-empty) {
    $env.EDITOR = 'nvim'
    $env.VISUAL = 'nvim'
    $env.config.buffer_editor = 'nvim'
} else {
    $env.EDITOR = 'vim'
    $env.VISUAL = 'vim'
    $env.config.buffer_editor = 'vim'
}

alias eza = eza -bF --group-directories-first --smart-group # --colour-scale=all
alias ll = eza -lah --git --git-repos
alias lg = eza -laGh --git --git-repos --no-time
alias lS = eza -lah --git --git-repos --total-size
alias tree = eza --tree
alias desc = eza -dlbhH@ --git

