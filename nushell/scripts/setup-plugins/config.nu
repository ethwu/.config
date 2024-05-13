# Configuration for plugins.

# Used by `config.nu`, so the files will have already been created if
# they are needed.

# The prefix to save cached setup files to.
const plugin_prefix = ($nu.default-config-dir | path join local plugins)

const zoxide = ($plugin_prefix | path join zoxide.nu)
if ($zoxide | path exists) {
    source $zoxide
}
