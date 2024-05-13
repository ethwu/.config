# Load common environment variables.

# Load environment variables from `env.toml`.
export def --env load-environment [
    environment_file: path = ($nu.default-config-dir | path join env.toml)
] {
    # Set the XDG base directories.
    if ('XDG_CONFIG_HOME' not-in $env) { $env.XDG_CONFIG_HOME = ($env.HOME | path join .config) }
    if ('XDG_CACHE_HOME' not-in $env) { $env.XDG_CACHE_HOME = ($env.HOME | path join .cache) }
    let local_prefix = ($env.HOME | path join .local)
    if ('XDG_BIN_HOME' not-in $env) { $env.XDG_BIN_HOME = ($local_prefix | path join bin) }
    if ('XDG_DATA_HOME' not-in $env) { $env.XDG_DATA_HOME = ($local_prefix | path join share) }
    if ('XDG_STATE_HOME' not-in $env) { $env.XDG_STATE_HOME = ($local_prefix | path join state) }

    if ('XDG_DATA_DIRS' not-in $env) { $env.XDG_DATA_DIRS = ([ /usr/local/share /usr/share ] | str join :) }
    if ('XDG_CONFIG_DIRS' not-in $env) { $env.XDG_CONFIG_DIRS = ([ /usr/local/share /usr/share ] | str join :) }
    if ('XDG_RUNTIME_DIR' not-in $env) { $env.XDG_RUNTIME_DIR = ($local_prefix | path join run user (id -u)) }

    if ($environment_file | path exists) {
        open $environment_file
            | flatten
            | transpose key value
            | update value { |row|
                $row.value
                    | str replace --all --regex '~|\$HOME' $env.HOME
                    | str replace --all '$XDG_CACHE_HOME' $env.XDG_CACHE_HOME
                    | str replace --all '$XDG_CONFIG_HOME' $env.XDG_CONFIG_HOME
                    | str replace --all '$XDG_DATA_HOME' $env.XDG_DATA_HOME
                    | str replace --all '$XDG_STATE_HOME' $env.XDG_STATE_HOME
                }
            | transpose --as-record --header-row
            | load-env
    }
}

# Add paths to `PATH`.
export def --env setup-path [] {
    $env.PATH = ([
        $env.XDG_BIN_HOME
        ($env.HOME | path join .local bin)
        (if 'CARGO_HOME' in $env { $env.CARGO_HOME | path join bin })
        (if 'GEM_HOME' in $env { $env.GEM_HOME | path join bin })
        (if 'GOPATH' in $env { $env.GOPATH | path join bin })
        (if 'RYE_HOME' in $env { $env.RYE_HOME | path join shims })
    ] ++ $env.PATH | uniq)
}
