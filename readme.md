Various small utility scripts for my `$PATH` under the `bin` directory. Some of
them may be fairly reusable as is for others, whereas other scripts may be very
specific to my setup 👉 [vyp/dots].

# hlwm-polybar

A script to show focused, occupied, free and urgent herbstluftwm tags in polybar
using lemonbar formatting tags. It assumes it is being used only in a single
monitor setup for now.

# hlwm-tag

A small `herbstclient` wrapper script for use with [herbstluftwm].

It can be used to either switch to, or move the focused client to, the next
occupied or free tag.

Usage:

``` shell
$ hlwm-tag <action> <tag>
```

Where `<action>` is either `use`, `move` or `both`, and `<tag>` is either
`free` or `occupied`.

[vyp/dots]: https://github.com/vyp/dots
[herbstluftwm]: http://www.herbstluftwm.org
