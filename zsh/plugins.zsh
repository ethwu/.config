
# Location of completions functions.
export FPATH="$ZDOTDIR/completions:$FPATH"

# Location of the environment setup cache.
envcache="$ZDOTDIR/env-setup-cache"
mkdir -p "$envcache"

# Cache environment setup scripts.
zshrc-cache-env-setup-of() {
    cmd="$1" ; shift

    if type "$cmd" > /dev/null ; then
        if [[ ! -f "$envcache"/"$cmd" ]] ; then
            "$cmd" "$@" > "$envcache"/"$cmd"
        fi
        source "$envcache"/"$cmd"
    fi
}

zshrc-cache-env-setup-of direnv hook zsh
zshrc-cache-env-setup-of mise activate zsh

zshrc-cache-env-setup-of fzf --zsh
zshrc-cache-env-setup-of zoxide init zsh --cmd k
# Correct the autocompletion function name.
function __zoxide_k_complete() {
    exec __zoxide_z_complete "$@"
}

[[ -f "$ZDOTDIR/local/plugins.zsh" ]] && source "$ZDOTDIR/local/plugins.zsh"

unset -f zshrc-cache-env-setup-of
unset envcache


