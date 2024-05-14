# Load common environment variables.

export-env {
    let local_env = ($nu.default-config-dir | path join local env.toml)

    # Load environment variables from `env.toml`.
    def --env load-environment [] string -> nothing {
        ($in
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
            | load-env)
    }

    # Add paths to `PATH`.
    def --env add-to-path [path: list] {
        $env.PATH = ($path ++ ($env.PATH | split row (char esep)) | uniq)

        # Add the same directories to the plugin search path.
        $env.NU_PLUGIN_DIRS ++= $env.PATH
    }

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

    let global_env = ($nu.default-config-dir | path join env.toml)
    if ($global_env | path exists) {
        ($global_env
            | open
            | flatten
            | load-environment)
        add-to-path [
            $env.XDG_BIN_HOME
            ($env.HOME | path join .local bin)
            (if 'CARGO_HOME' in $env { $env.CARGO_HOME | path join bin })
            (if 'GEM_HOME' in $env { $env.GEM_HOME | path join bin })
            (if 'GOPATH' in $env { $env.GOPATH | path join bin })
            (if 'RYE_HOME' in $env { $env.RYE_HOME | path join shims })
        ]
    }
    let local_env = ($nu.default-config-dir | path join local env.toml)
    if ($local_env | path exists) {
        ($local_env
            | open
            | get env
            | flatten
            | load-environment)
        add-to-path (open $local_env | get extend-path)
    }
}




