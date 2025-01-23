#! /usr/bin/env -S nu --stdin

# Interpolate environment variables into the given string.
export def main [str: string = ""] : [nothing -> string, string -> string] {
    # https://github.com/nushell/nushell/issues/12750#issuecomment-2093608578
    mut str = if $str == "" { $in } else { $str }
    loop {
        let var = ($str | parse --regex '.*\$(?<var>[a-zA-Z0-9_]+).*') | get -i var.0
        if ($var | is-empty) { break }
        let replacement = $env | get -i $var | default $var
        $str = ($str | str replace --all $"$($var)" $replacement)
    }
    $str
}

