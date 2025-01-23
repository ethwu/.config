# Environment setup for plugins.

do {
    # The prefix to save cached setup files to.
    const plugin_prefix = ($nu.default-config-dir | path join local plugins)
    # Create the prefix if it doesn't exist.
    mkdir $plugin_prefix

    # The plugin config file.
    const plugin_config = ($nu.default-config-dir | path join setup plugins config.nu)
    "" | save --force $plugin_config

    # Load a shell plugin (if it's available).
    def load-plugin [cmd: string, ...args: string] {
        if (which $cmd | is-not-empty) {
            "source '" + ($plugin_prefix | path join $"($cmd).nu") + "'\n" | save --append $plugin_config
            ^$cmd ...$args
        } else {
            ""
        } | save -f ($plugin_prefix | path join $"($cmd).nu")
    }

    load-plugin zoxide init nushell '--cmd' k
    load-plugin mise activate nu
}

