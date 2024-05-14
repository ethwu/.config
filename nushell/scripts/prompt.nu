# Definitions for building the prompt.

# Predefined prompt segments.
module prompt_segment {
    # Get the duration of the last command in yellow.
    export def duration [] {
        let elapsed = $env.CMD_DURATION_MS | into int | into duration --unit ms
        $"(ansi reset)(ansi yellow)($elapsed)"
    }

    # Get the history name in red.
    export def history_number [] {
        $"(ansi reset)(ansi red)(history | length)"
    }

    # Get the exit code of the last command.
    export def last_exit_code [] {
        let exit_code = $env.LAST_EXIT_CODE
        let color = if $exit_code == 0 { 'red' } else { 'red_bold' }
        $"(ansi reset)(ansi $color)($exit_code)"
    }

    # Get the time in magenta with green separators and am/pm underlined.
    export def time [] {
        ([
            (ansi reset)
            (ansi magenta)
            (date now | format date '%x %X') # try to respect user's locale
        ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
            str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")
    }

    # Get the user and hostname in green, separated by a yellow `@`.
    export def userhost [] {
        $"(ansi reset)"
        ([
            (ansi reset) (ansi green_italic)
            ($env.USER)
            (ansi reset) (ansi yellow)
            '@'
            (ansi reset) (ansi green_italic)
            (sys host).hostname
        ] | str join)
    }

    # Get VCS information.
    export def vcs [] {
        let g = gstat
        if $g.repo_name == no_repository { return "" }
        let git_dir = (git rev-parse --git-dir | path expand)
        let detached = (git symbolic-ref --quiet HEAD | complete).exit_code == 1
        let staged = $g.idx_added_staged + $g.idx_modified_staged + $g.idx_deleted_staged + $g.idx_renamed + $g.idx_type_changed
        let unstaged = $g.wt_untracked + $g.wt_modified + $g.wt_deleted + $g.wt_type_changed + $g.wt_renamed
        # Detect if a rebase is in progress.
        let rebase_apply = ($git_dir | path join rebase-apply)
        let rebase_merge = ($git_dir | path join rebase-merge)
        let rewrite_type = (if ($rebase_apply | path exists) { "rebase" }
            else if ($rebase_merge | path exists) { "rebase-i" }
            else if ($git_dir | path join MERGE_HEAD | path exists) { "merge" })
        let rewrite_details = (match $rewrite_type {
            "rebase" => $rebase_apply
            "rebase-i" => $rebase_merge
            "merge" => $rebase_merge
        })
        let rewrite_remaining = ($rewrite_details | path join msgnum)
        let rewrite_total = ($rewrite_details | path join end)
        let rewrite_remaining = if (($rewrite_details != null) and ($rewrite_remaining | path exists) and ($rewrite_total | path exists)) {
            $"(ansi red)(open $rewrite_remaining | into int)/(open $rewrite_total | into int)"
        }

        let branch_symbol = if $detached { "@" } else if $g.branch != no_branch {
            if $g.tag != no_tag { "#" } else { $"(ansi cyan) " }
        }
        ([
            $"(ansi reset)($branch_symbol)(ansi cyan)($g.branch)"
            (if $g.tag != no_tag and $g.branch != $g.branch { $"(ansi reset)#(ansi cyan)($g.tag)" })
            ([
                (if $g.behind > 0 { $"(ansi cyan)⇣($g.behind)" })
                (if $g.ahead > 0 { $"(ansi cyan)⇡($g.ahead)" })
            ] | str join)
            (if $g.stashes > 0 { $"(ansi cyan)*($g.stashes)" })
            (if $rewrite_type != null { [
                $"(ansi red_bold)($rewrite_type)"
                $"(rewrite_remaining)(ansi reset)"
                (if $g.conflicts > 0 { $"≠($g.conflicts)(ansi reset)" })
            ] | filter { is-not-empty } | str join " " })
            (if $staged > 0 {
                $"(ansi reset)(ansi blue_bold)!($staged) (ansi reset)([
                    (if $g.idx_added_staged > 0 { $"(ansi green)^($g.idx_added_staged)" })
                    (if $g.idx_modified_staged > 0 { $"(ansi yellow)+($g.idx_modified_staged)" })
                    (if $g.idx_deleted_staged > 0 { $"(ansi red)-($g.idx_deleted_staged)" })
                    (if $g.idx_renamed > 0 { $"(ansi blue)~($g.idx_renamed)" })
                    (if $g.idx_type_changed > 0 { $"(ansi purple)÷($g.idx_type_changed)" })
                ] | filter { is-not-empty } | str join $"(ansi reset)/")"
            })
            (if $unstaged > 0 {
                $"(ansi reset)(ansi magenta_bold)?($unstaged) (ansi reset)([
                    (if $g.wt_untracked > 0 { $"(ansi green_dimmed)^($g.wt_untracked)" })
                    (if $g.wt_modified > 0 { $"(ansi yellow_dimmed)+($g.wt_modified)" })
                    (if $g.wt_deleted > 0 { $"(ansi red_dimmed)-($g.wt_deleted)" })
                    (if $g.wt_renamed > 0 { $"(ansi blue_dimmed)~($g.wt_renamed)" })
                    (if $g.wt_type_changed > 0 { $"(ansi purple_dimmed)÷($g.wt_type_changed)" })
                ] | filter { is-not-empty } | str join $"(ansi reset)/")"
            })
        ] | where { || is-not-empty } | str join " ")
    }

    # Get a prompt segment for the current working directory.
    export def working_directory [] {
        let dir = match (do --ignore-shell-errors { $env.PWD | path relative-to $nu.home-path }) {
            null => $env.PWD
            '' => '~'
            $relative_pwd => ([~ $relative_pwd] | path join)
        }
        let path_color = (if (is-admin) { ansi cyan_bold } else { ansi green_bold })
        let separator_color = (if (is-admin) { ansi light_cyan_bold } else { ansi light_green_bold })
        let path_segment = $"($path_color)($dir)"

        $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
    }
}

use prompt_segment

# Wrap the given prompt segment in brackets if it has any contents.
def bracket [segment: string] {
    if $segment != '' {
        $"(ansi reset)[($segment)(ansi reset)]"
    } else {
        ""
    }
}

# Generate the left prompt.
export def left [] -> string {
    ([
        (prompt_segment last_exit_code)
        (bracket (prompt_segment working_directory))
        (bracket (prompt_segment vcs))
        (prompt_segment history_number)
    ] | filter { || is-not-empty } | str join (char space))
}

# Generate the right prompt.
export def right [] -> string {
    mut segments = [(prompt_segment duration)]
    if ('SSH_CLIENT' in $env or 'SSH_TTY' in $env) {
        $segments = ($segments | append (prompt_segment userhost))
    }
    $segments | str join (char space)
}

# Highlight non-zero exit codes.
def exit_code_highlight [
    success_color: string = ""  # Color to use on a success
    failure_color: string = "" # Color to use on a failure
] nothing -> string {
    if $env.LAST_EXIT_CODE == 0 {
        $"(if $success_color != "" {ansi $success_color})"
    } else {
        $"(ansi u)(if $failure_color != "" {ansi $failure_color} else {ansi $success_color})"
    }
}

# Get the prompt character.
export def character [] nothing -> string {
    if (is-admin) { "#" } else { ">" }
}

# Set the prompt character.
export def --env set-character [] nothing -> nothing {
    $env.PROMPT_CHARACTER = (character)
}

# Get the prompt indicator.
export def indicator [] -> string {
    $" (exit_code_highlight blue_bold red_bold)($env.PROMPT_CHARACTER)(ansi reset) "
}

# Get the multiline continuation indicator.
export def indicator_multiline [] {
    $"(exit_code_highlight blue_bold red_bold):::(ansi reset) "
}

# Get the prompt indicator for `vi` insert mode.
export def indicator_vi_insert [] -> string {
    indicator
}

# Get the prompt indicator for `vi` normal mode.
export def indicator_vi_normal [] -> string {
    $" (exit_code_highlight green_bold)($env.PROMPT_CHARACTER)(ansi reset) "
}

# Get the prompt indicator for searching the menu.
export def indicator_menu [] -> string {
    $" (ansi yellow_bold)|(ansi reset) "
}

# Set up the prompt.
export def --env setup [] nothing -> nothing {
    $env.PROMPT_COMMAND = { left }
    $env.PROMPT_COMMAND_RIGHT = { right }

    set-character
    $env.PROMPT_INDICATOR = { indicator }
    $env.PROMPT_INDICATOR_VI_INSERT = { indicator_vi_insert }
    $env.PROMPT_INDICATOR_VI_NORMAL = { indicator_vi_normal }
    $env.PROMPT_MULTILINE_INDICATOR = { indicator_multiline }

    # $env.TRANSIENT_PROMPT_COMMAND = {|| "🚀 " }
    # $env.TRANSIENT_PROMPT_INDICATOR = {|| "" }
    # $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| "" }
    # $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| "" }
    # $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "" }
    # $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| "" }
}