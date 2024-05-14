# Environment setup for plugins.

do {
    # The prefix to save cached setup files to.
    const plugin_prefix = ($nu.default-config-dir | path join local plugins)
    # Create the prefix if it doesn't exist.
    mkdir $plugin_prefix

    # Load a shell plugin (if it's available).
    def load-plugin [cmd: string, ...args: string] [nothing -> string, string -> string] {
        if (which $cmd | is-not-empty) {
            ^$cmd ...$args
        } else {
            ""
        } | save -f ($plugin_prefix | path join $"($cmd).nu")
    }

    load-plugin zoxide init nushell '--cmd' k
}
