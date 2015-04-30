# Comments

I have 2 different types of comments:
    - Long comments
    - Short comments

Long comments are for big long documentation and stuff. They start with a
capital letter and are in decent English.
Short comments generally belong just above a line to explain what it does
or something. Short and to the point, omit articles and no caps at start.
Sometimes I use short comments on the same line (if it's safe to do so in that
language & it's a short line).

I occasionally swear in my comments -- it's just joking around :D


# Shebang

## What is it?

The 'shebang' (`#!`) in a script indicates to the system which program (i.e.
interpreter) should run it. Interpreters don't use the line, either because `#`
indicates a comment (bash, Python) or because it knows not to process the first
line if it starts with `#!` (no examples though lol, most interpreted languages
have comments as `#`)


## Why is it needed?

If you set the executable bit on a **non-binary file**, the computer has every
right to be confused unless you tell it *how to use* (i.e. run) the file.
The magic-number-thing `#~!` means that scripts can be invoked like 'normal'
compiled programs, which is nice.


## Any styling tips?

Sometimes people put a space between the `#!` and the path - this makes no
difference and is just a styling thing. I've been using no space, so preferably
keep this constant.

See [this link](http://www.in-ulm.de/~mascheck/various/shebang/) for waaaay too
much detail on the whole shebang (heh).


## The path: /bin/bash or /usr/bin/env bash???

As you now know, `#!/bin/bash` tells the system to run the script with
the program at `/bin/bash`. So that means `/usr/bin/env bash` runs the script
as `usr/bin/env bash script`.

The former assumes that bash is stored in the `/bin` directory. A fair guess,
to be fair.

The latter assumes that `/usr/bin/env` is available, and runs **whichever bash
it finds first on the $PATH.** You can't simply put `#!bash`, because the
system doesn't check the path for the shebang, hah! Therefore, absolute paths
are required.

The rationale behind using `/usr/bin/env foo` instead of `/path/to/foo` is for
greater portability. The `env` manpage states that it simply "[runs] a
program in a modified environment". Without any NAME=VALUE arguments, you're
just running that program. But `env` searches the `$PATH`, unlike the magic
number thing `#!`. This means you're never looking in the wrong place.

So even if Python isn't installed at /usr/bin/python, by using the line
`/usr/bin/env python`, if it's on the path (and if `env` is installed, which is
likely, being part of the `coreutils` package), it'll run.

See [Wikipedia](http://en.wikipedia.org/wiki/Shebang_%28Unix%29) for more
detail.

**Important for Python:** `usr/bin/env python3.2` would guarantee running as
Python 3.2 rather than the default (which could be Python 2.7, for example).
Useful, but only perhaps, because maybe 3.2 might be outdated eventually. If it
is, though, they should keep a symlink, because it'd just be like common
courtesy.
