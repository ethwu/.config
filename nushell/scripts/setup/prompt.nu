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

# Generate the left prompt.
export def create_left_prompt [] {
    ([
        (prompt_segment last_exit_code)
        $"(ansi reset)[(prompt_segment working_directory)(ansi reset)]"
        (prompt_segment history_number)
    ] | str join (char space))
}

# Generate the right prompt.
export def create_right_prompt [] {
    mut segments = [(prompt_segment duration)]
    if ('SSH_CLIENT' in $env or 'SSH_TTY' in $env) {
        $segments = ($segments | append (prompt_segment userhost))
    }
    $segments | str join (char space)
}
