# Environment setup for plugins.

export def main [] {
    # The prefix to save cached setup files to.
    const plugin_prefix = ($nu.default-config-dir | path join local plugins)
    # Create the prefix if it doesn't exist.
    mkdir $plugin_prefix

    if (which zoxide | is-not-empty) {
        zoxide init nushell --cmd k | save -f ($plugin_prefix | path join zoxide.nu)
    }
}
