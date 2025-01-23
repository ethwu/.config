# prompt.zsh
# ----------

if ! [[ "$ZSH_EVAL_CONTEXT" =~ :file$ ]] ; then
    echo 'prompt.zsh'
    echo
    echo 'Usage:'
    echo '    source prompt.zsh [options]'
    echo
    echo 'Options:'
    echo '    --user      Show the username in the prompt.'
    echo '    --host      Show the hostname in the prompt.'
    echo '    --elapsed   Show the time elapsed during commands.'
    echo '    --vcs       Show VCS information when applicable.'
    echo '    --jobs      Show the number of background jobs.'
    exit 1
fi

setopt prompt_subst

zparseopts -D -E \
    -user=_prompt_show_user \
    -host=_prompt_show_host \
    -elapsed=_prompt_show_elapsed \
    -vcs=_prompt_show_vcs \
    -jobs=_prompt_show_jobs

local end_opts=$@[(i)(--|-)]
set -- "${@[0, end_opts - 1]}" "${@[end_opts + 1, -1]}"

export PROMPT=
export RPROMPT=

PROMPT="%F{red}%? %F{default}["

if [[ "$_prompt_show_user" ]] ; then
    PROMPT+="%F{green}%n"
    if [[ "$_prompt_show_host" ]] ; then
        PROMPT+="%F{yellow}@"
    fi
fi

if [[ "$_prompt_show_host" ]] ; then
    PROMPT+="%F{green}%m"
fi

if [[ "$_prompt_show_user" ]] || [[ "$_prompt_show_host" ]] ; then
    PROMPT+="%F{yellow}:"
fi

PROMPT+="%F{green}%-2>…>%(4~|%-1~/…%2~|%~)%>>%F{default}] "

if [[ "$_prompt_show_vcs" ]] ; then
    autoload -Uz vcs_info
    zstyle ':vcs_info:*:*' formats "%b%c%u "
    zstyle ':vcs_info:*:*' actionformats "%b%c%u (%a) "
    zstyle ':vcs_info:*:*' stagedstr "+"
    zstyle ':vcs_info:*:*' unstagedstr "*"
    zstyle ':vcs_info:*:*' check-for-changes true
    zstyle ':vcs_info:*' enable git

    PROMPT+="%-10(l::
)%(1v.%F{cyan}%1v%f.)"
fi

# Color prompt for vim editing modes.
_prompt_vi_mode=
function zle-line-init() {
    _prompt_vi_mode="%(?.%F{blue}.%F{red})"
    zle reset-prompt
}
zle -N zle-line-init
function zle-keymap-select() {
    _prompt_vi_mode="${${KEYMAP/vicmd/"%F{green}"}/(main|viins|emacs)/"%(?.%F{blue}.%F{red})"}"
    zle reset-prompt
}
zle -N zle-keymap-select

PROMPT+="%-20(l::
)%F{red}%h %(?..%U)\$_prompt_vi_mode%#%u %F{default}"

if [[ "$_prompt_show_elapsed" ]] ; then
    function preexec() {
        timer="$SECONDS"
        cmd="$1"
    }
fi

function precmd() {
    psvar=()

    [[ $? -gt 0 ]] && was_err="$err_fmt" || was_err=

    RPROMPT=

    # Whether to add space before the next segment.
    local add_space=0

    if [[ "$_prompt_show_elapsed" ]] && [[ "$cmd" ]] ; then
        cmd=

        local now="$SECONDS"
        local elapsed=$((now - timer))

        RPROMPT+="%F{yellow}"
        if [[ $elapsed -gt 86400 ]] ; then
            local days=$((elapsed / 86400))
            elapsed=$((elapsed % 86400))
            if [[ $days -gt 0 ]] ; then
                (( $add_space )) && RPROMPT+=' ' ; add_space=1
                RPROMPT+="${days}d"
            fi
        fi

        if [[ $elapsed -gt 3600 ]] ; then
            local hours=$((elapsed / 3600))
            elapsed=$((elapsed % 3600))
            if [[ $hours -gt 0 ]] ; then
                (( $add_space )) && RPROMPT+=' ' ; add_space=1
                RPROMPT+="${hours}h"
            fi
        fi

        if [[ $elapsed -gt 60 ]] ; then
            local minutes=$((elapsed / 60))
            elapsed=$((elapsed % 60))
            if [[ $hours -gt 0 ]] ; then
                (( $add_space )) && RPROMPT+=' ' ; add_space=1
                RPROMPT+="${minutes}m"
            fi
        fi

        if [[ $elapsed -gt 0 ]] ; then
            (( $add_space )) && RPROMPT+=' ' ; add_space=1
            RPROMPT+="${elapsed}s"
        fi

        RPROMPT+="%{$reset_color%}"
    fi

    if [[ "$_prompt_show_jobs" ]] ; then
        local sp
        (( $add_space )) && sp=' ' || sp='' ; add_space=1
        RPROMPT+="%1(j.$sp%F{red}•%2(j. %j.).)"
        RPROMPT+="%{$reset_color%}"
    fi

    if [[ "$_prompt_show_vcs" ]] ; then
        vcs_info
        [[ -n $vcs_info_msg_0_ ]] && print -v 'psvar[1]' -Pr -- "$vcs_info_msg_0_"
    fi

    if (( $(print -P "$PROMPT" 2> /dev/null | wc -l) > 1 )) ; then
        print ""
    fi
}

# Continuation Prompts

# prompt continuation
export PROMPT2="%(?.%F{blue}.%F{red})┆ %F{red}%! %F{yellow}%_%(?.%F{blue}.%F{red})%B>%b%f "
# `select` prompt
export PROMPT3="%F{blue}%B?)%b%f "
# debug prompt
export PROMPT4="%F{green}┆ %N%f:%F{yellow}%i%f "
# change partial line output marker
export PROMPT_EOL_MARK="%S‡%s"
export PROMPT_EOL_MARK="%S⚑%s"
export PROMPT_EOL_MARK="%S⚐%s"


