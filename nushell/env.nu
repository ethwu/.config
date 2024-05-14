# Nushell Environment Config File
#
# version = "0.93.0"

# Make scripts available for sourcing.
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join scripts)
]

# Add environment variables and update `PATH`.
source ./setup/profile.nu

# Prompt module.
use ./scripts/prompt.nu
prompt setup

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Set up plugins.
source ./setup/plugins/env.nu
