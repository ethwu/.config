# The colors to be used in the color scheme.
export const colors = {
    "type": {
        "bool": {
            "false": "red_italic",
            "true": "green_italic"
        },
        "date": "yellow_bold",
        "number": {
            "file_size": "light_purple",
            "float": "light_blue",
            "int": "light_blue",
            "range": "blue"
        },
        "null": "cyan_italic",
        "path": {
            "file": "light_green_italic",
            "directory": "light_purple_underline"
        },
        "string": {
            "binary": "blue_bold",
            "literal": "purple_italic",
            "path": "light_green"
        },
        "time": "yellow"
    },
    "punctuation": {
        "block": "blue_bold",
        "list": "blue_bold",
        "operator": "light_purple",
        "record": "purple_bold",
        "separator": "dark_gray",
        "whitespace": "light_gray"
    },
    "language": {
        "argument": "yellow_italic",
        "comment": "green_italic",
        "keyword": "purple_bold",
        "variable": "purple_italic"
    },
    "shell": {
        "builtin": "blue_bold",
        "command": "green_bold",
        "empty": "light_gray",
        "flag": "yellow",
        "glob": "blue_italic"
        "header": "green_bold",
        "hint": "dark_gray",
        "index": "green",
        "pattern": "red_italic",
        "signature": "light_purple_italic",
        "unresolved_command": "cyan"
    },
    "gradient": [
        "light_purple_bold",
        "purple_bold",
        "light_purple",
        "purple",
        "light_blue",
        "blue",
        "light_green",
        "green",
        "light_yellow",
        "yellow",
        "light_cyan",
        "cyan",
        "light_red",
        "red"
    ],
}

# Get a color from the gradients list using the given thresholds.
export def get-gradient-color [
    thresholds: list<any>,                      # A list of thresholds in ascending order
    gradient: list<string> = $colors.gradient   # The gradient to follow
] : any -> string {
    # The value to check against the thresholds.
    let value = $in
    let matches = ($thresholds | enumerate | where $value < $it.item)
    if ($matches | is-not-empty) {
        let idx = ($matches | first).index
        if $idx < ($gradient | length) {
            return ($gradient | get $idx)
        }
    }
    $gradient | last
}

# Colorizer for booleans.
export def bool [] : bool -> string {
    if $in { $colors.type.bool.true } else { $colors.type.bool.false }
}

# Colorizer for durations.
export def time-elapsed [] : duration -> string {
    get-gradient-color [ 1ns, 1us, 1ms, 1sec, 1min, 15min, 1hr, 12hr, 1day, 4day, 1wk, 4wk, 178day, 356day ]
}

# Colorizer for datetimes.
export def date-time [] : datetime -> string {
     ((date now) - $in | math abs) | time-elapsed
}

# Colorizer for file sizes.
export def file-size [] : filesize -> string {
    get-gradient-color [ 1B, 10B, 100B, 1KiB, 10KiB, 50KiB, 100KiB, 1MiB, 10MiB, 100MiB, 1GiB, 10GiB, 100GiB, 1TiB ]
} 

export def main [] { return {
    # color for nushell primitives
    separator: $colors.punctuation.separator
    leading_trailing_space_bg: $colors.punctuation.whitespace
    # leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: $colors.shell.header
    empty: $colors.shell.empty
    bool: { bool }
    int: $colors.type.number.int
    filesize: { file-size }
    duration: { time-elapsed }
    date: { date-time }
    range: $colors.type.number.range
    float: $colors.type.number.float
    string: $colors.type.string.literal
    nothing: $colors.type.null
    binary: $colors.type.string.binary
    cell-path: $colors.type.string.path
    row_index: $colors.shell.index
    record: $colors.punctuation.record
    list: $colors.punctuation.list
    block: $colors.punctuation.block
    hints: $colors.shell.hint
    search_result: { bg: red, fg: white }
    shape_and: { color: $colors.language.keyword, attr: b }
    shape_binary: { color: $colors.language.keyword, attr: b }
    shape_block: $colors.punctuation.block
    shape_bool: { bool }
    shape_closure: $colors.punctuation.block
    shape_custom: { color: $colors.shell.command, attr: italic }
    shape_datetime: $colors.type.date
    shape_directory: $colors.type.path.directory
    shape_external: $colors.shell.unresolved_command
    shape_externalarg: $colors.language.argument
    shape_external_resolved: $colors.shell.command
    shape_filepath: $colors.type.string.path
    shape_filesize: { file-size }
    shape_flag: $colors.shell.flag
    shape_float: $colors.type.number.float
    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: white bg: red attr: b}
    shape_globpattern: $colors.shell.glob
    shape_int: $colors.type.number.int
    shape_internalcall: $colors.shell.builtin
    shape_keyword: $colors.language.keyword
    shape_list: $colors.punctuation.list
    shape_literal: $colors.language.keyword
    shape_match_pattern: $colors.shell.pattern
    shape_matching_brackets: { attr: u }
    shape_nothing: $colors.shell.empty
    shape_operator: $colors.punctuation.operator
    shape_or: { color: $colors.language.keyword, attr: b }
    shape_pipe: $colors.punctuation.operator
    shape_range: $colors.type.number.range
    shape_record: $colors.punctuation.record
    shape_redirection: $colors.punctuation.operator
    shape_signature: $colors.shell.signature
    shape_string: $colors.type.string.literal
    shape_string_interpolation: { color: $colors.type.string.literal attr: bold }
    shape_table: $colors.punctuation.record
    shape_variable: $colors.language.variable
    shape_vardecl: $colors.language.variable
    shape_raw_string: $colors.type.string.path
}}
