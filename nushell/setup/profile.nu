# Load common environment variables.

export-env {
    use ($nu.default-config-dir | path join scripts env-string.nu)

    # Load environment variables from `env.toml`.
    def --env load-environment []: string -> nothing {
        ($in
            | transpose key value
            | update value { env-string }
            | transpose --as-record --header-row
            | load-env)
    }

    # Add paths to `PATH`.
    def --env add-to-path [prepend: list, append: list] {
        let prepend = ($prepend | each { env-string | path expand })
        let append = ($append | each { env-string | path expand })
        $env.PATH = (($prepend ++ $env.PATH ++ $append) | uniq)

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
    }

    # Convert the `PATH` from the host process.
    $env.PATH = ($env.PATH | split row (char esep))

    let global_path = ($nu.default-config-dir | path join path.toml)
    if ($global_path | path exists) {
        let global_path = (open $global_path)
        if 'path' in $global_path {
            let prepend = if 'prepend' in $global_path.path { $global_path.path.prepend } else { [] }
            let append = if 'append' in $global_path.path { $global_path.path.append } else { [] }
            add-to-path $prepend $append
        }
    }
    let local_env = ($nu.default-config-dir | path join local env.toml)
    if ($local_env | path exists) {
        let local_env = (open $local_env)
        if 'env' in $local_env {
            ($local_env).env | flatten | load-environment
        }
        if 'path' in $local_env {
            let prepend = if 'prepend' in $local_env.path { $local_env.path.prepend } else { [] }
            let append = if 'append' in $local_env.path { $local_env.path.append } else { [] }
            add-to-path $prepend $append
        }
    }
}




