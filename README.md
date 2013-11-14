nowhat
======

Simple todo list parser

`Usage: nowhat.sh filename`

Parses a simple formatted todo list and prints what you should be doing now.
See todo.txt for a sample todo list.

I use it in my tmux powerline like so:

`set -g status-right '#(eval /home/ab/Code/nowhat/nowhat.sh /home/ab/Code/nowhat/today.txt)'`
