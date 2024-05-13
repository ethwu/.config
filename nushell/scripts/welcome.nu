# Get the welcome message.
export def main [] {
    let user = $env.USER
    let host = sys host
    let hostname = $host.hostname
    ([
        (ansi red_bold) $host.long_os_version ' ' (ansi reset)
        (ansi red_italic) $"\(($host.kernel_version)\)\n" (ansi reset)
        $"Logged in as (ansi green_italic)($user)(ansi reset) on (ansi green_italic)($hostname)(ansi reset)."
        (char newline)
        $"Uptime: " (ansi blue_italic) $host.uptime (ansi reset)
    ] | str join)
}