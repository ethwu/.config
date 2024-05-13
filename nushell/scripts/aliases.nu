
# Alias `just`.
if (which just | is-not-empty) {
    alias j = just
}

# Use `nvim` if it's available.
if (which nvim | is-not-empty) {
    alias vim = nvim
    $env.EDITOR = 'nvim'
    $env.VISUAL = 'nvim'
    $env.config.buffer_editor = 'nvim'
}
