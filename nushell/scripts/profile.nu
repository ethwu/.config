# Load common environment variables.

let config_home = if 'XDG_CONFIG_HOME' in $env { $env.XDG_CONFIG_HOME } else { '~/.config' }
let environment_file = ($config_home | path join env.toml )
if ($environment_file | path exists) {
    open $environment_file | from toml | load-env
}
