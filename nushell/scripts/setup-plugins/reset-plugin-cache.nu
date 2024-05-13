# Reset the cached plugin setup scripts.

# The prefix where plugin setup scripts are stored.
const plugin_prefix = ($nu.default-config-dir | path join local plugins)

# Reset the cached plugin setup scripts.
export def main [
    path: string = $plugin_prefix   # The path to the plugin setup dir
] nothing -> nothing {
    rm --recursive --interactive-once --trash $path
}
