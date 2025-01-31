# Nushell Config File
#
# version = "0.101.0"

# Get themes.
use ./theme

$env.config.color_config = (theme midori)

# Hide the welcome banner.
$env.config.show_banner = false

# Use the `vi` mode for the line editor.
$env.config.edit_mode = "vi"
$env.config.cursor_shape.emacs = "inherit"
$env.config.cursor_shape.vi_insert = "blink_block"
$env.config.cursor_shape.vi_normal = "block"

# Only show the index if there's an "index" column.
$env.config.table.index_mode = "auto"
$env.config.table.trim.methodology = "wrapping"
$env.config.table.trim.truncating_suffix = "…"
# Show the header on the separator line.
$env.config.table.header_on_separator = true

$env.config.hooks.pre_prompt = [
    # {
    #     if (which direnv | is-empty) { return }
    #     direnv export json | from json | default {} | load-env
    # }
]

$env.config.keybindings ++= [

]

$env.config.menus ++= [
    # Configuration for default nushell menus
    # Note the lack of source parameter
    {
        name: completion_menu
        only_buffer_difference: false
        marker: (prompt indicator menu)
        type: {
            layout: columnar
            columns: 4
            col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
        }
        style: {
            text: green
            selected_text: { attr: r }
            description_text: yellow
            match_text: { attr: u }
            selected_match_text: { attr: ur }
        }
    }
    {
        name: ide_completion_menu
        only_buffer_difference: false
        marker: (prompt indicator menu)
        type: {
            layout: ide
            min_completion_width: 0,
            max_completion_width: 50,
            max_completion_height: 10, # will be limited by the available lines in the terminal
            padding: 0,
            border: true,
            cursor_offset: 0,
            description_mode: "prefer_right"
            min_description_width: 0
            max_description_width: 50
            max_description_height: 10
            description_offset: 1
            # If true, the cursor pos will be corrected, so the suggestions match up with the typed text
            #
            # C:\> str
            #      str join
            #      str trim
            #      str split
            correct_cursor_pos: false
        }
        style: {
            text: green
            selected_text: { attr: r }
            description_text: yellow
            match_text: { attr: u }
            selected_match_text: { attr: ur }
        }
    }
    {
        name: history_menu
        only_buffer_difference: true
        marker: (prompt indicator history)
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
    }
    {
        name: help_menu
        only_buffer_difference: true
        marker: (prompt indicator help)
        type: {
            layout: description
            columns: 4
            col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
    }
]

$env.config.keybindings ++= [
    {
        # IDE-style menu.
        name: open_menu
        modifier: control
        keycode: space
        mode: [emacs vi_insert vi_normal]
        event: { send: menu name: ide_completion_menu }
    }
    # {
    #     # Automatically open the menu when pressing space.
    #     name: open_menu_on_space
    #     modifier: none
    #     keycode: space
    #     mode: [emacs vi_insert]
    #     event: [
    #         { edit: insertstring value: " " }
    #         { send: menu name: ide_completion_menu }
    #     ]
    # }
    {
        name: tab_menu
        modifier: none
        keycode: tab
        mode: [emacs vi_insert vi_normal]
        event: {
            # Take the first event that triggers.
            until: [
                # # Accept the next word in the history.
                # { send: historyhintwordcomplete }
                { send: menu name: completion_menu }
                { send: submit }
            ]
        }
    }
    {
        name: accept_full_history
        modifier: shift
        keycode: backtab
        mode: [emacs vi_insert vi_normal vi_normal]
        event: {
            # Take the first event that triggers.
            until: [
                # Accept the full history hint.
                { send: historyhintcomplete }
                { send: menu name: completion_menu }
                { send: menuprevious }
            ]
        }
    }
]


# # Set up the aliases.
source ./setup/aliases.nu
# Set up plugins.
source ./setup/plugins/config.nu

use ./scripts *

# Print the welcome message.
welcome

