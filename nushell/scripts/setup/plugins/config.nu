# Configuration for plugins.

# Used by `config.nu`, so the files will have already been created if
# they are needed.

export def main [] {
    # The prefix to save cached setup files to.
    const plugin_prefix = ($nu.default-config-dir | path join local plugins)
    # A no-op script.
    const noop = ($nu.default-config-dir | path join local .keep)

    const zoxide = ($plugin_prefix | path join zoxide.nu)
    source (if ($zoxide | path exists) { $zoxide } else { $noop })
}
