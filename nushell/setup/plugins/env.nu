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
    def load-plugin [cmd: string, ...args: string] [nothing -> string, string -> string] {
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

# Completions.
use nu_scripts/custom-completions/ack/ack-completions.nu *
use nu_scripts/custom-completions/bat/bat-completions.nu *
use nu_scripts/custom-completions/cargo/cargo-completions.nu *
use nu_scripts/custom-completions/curl/curl-completions.nu *
use nu_scripts/custom-completions/git/git-completions.nu *
use nu_scripts/custom-completions/just/just-completions.nu *
use nu_scripts/custom-completions/less/less-completions.nu *
use nu_scripts/custom-completions/make/make-completions.nu *
use nu_scripts/custom-completions/man/man-completions.nu *
use nu_scripts/custom-completions/mvn/mvn-completions.nu *
use nu_scripts/custom-completions/nano/nano-completions.nu *
use nu_scripts/custom-completions/npm/npm-completions.nu *
use nu_scripts/custom-completions/pdm/pdm-completions.nu *
use nu_scripts/custom-completions/pnpm/pnpm-completions.nu *
use nu_scripts/custom-completions/poetry/poetry-completions.nu *
use nu_scripts/custom-completions/rg/rg-completions.nu *
use nu_scripts/custom-completions/rustup/rustup-completions.nu *
use nu_scripts/custom-completions/rye/rye-completions.nu *
use nu_scripts/custom-completions/tar/tar-completions.nu *
use nu_scripts/custom-completions/tealdeer/tldr-completions.nu *
use nu_scripts/custom-completions/vscode/vscode-completions.nu *
use nu_scripts/custom-completions/yarn/yarn-v4-completions.nu *

