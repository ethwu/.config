#! /usr/bin/env -S nu --stdin

# Time zone utility.
#
# Parse `stdin` to get a time, and output it using the time zone
# specified by `tz`. If nothing is passed to `stdin`, gets the current
# time.
export def main [
	tz: string = "EST" # The time zone to convert to.
]: [
	nothing -> datetime,  # default to now
	datetime -> datetime,  # specific datetime to display
	duration -> datetime,  # duration offset from now
	string -> datetime,  # keyword or parseable datetime
] {
	let stdin = $in
	let now = (date now)
	match ($stdin | describe | str replace --regex '<.*' '') {
		"datetime" => $stdin,
		"duration" => ($now + $stdin),
		"string" => { match $stdin {
			"yesterday" => ($now - 1day),
			"today" | "now" => $now,
			"tomorrow" => ($now + 1day),
			$when => ($when | into datetime),
		} },
		_ => $now,
	} | date to-timezone $tz
}

