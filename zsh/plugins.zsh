
# Location of completions functions.
export FPATH="$ZDOTDIR/completions:$FPATH"

# Location of the environment setup cache.
envcache="$ZDOTDIR/env-setup-cache"
mkdir -p "$envcache"

# Cache environment setup scripts.
function zshrc-cache-env-setup-of() {
    cmd="$1"
    shift

    if type "$cmd" > /dev/null && [[ ! -f "$envcache/$cmd" ]] ; then
        "$cmd" $@ > "$envcache/$cmd"
    fi

    source "$envcache/$cmd"
}

[[ -f "$ZDOTDIR/local/plugins.zsh" ]] && source "$ZDOTDIR/local/plugins.zsh"

unset -f zshrc-cache-env-setup-of
unset envcache


