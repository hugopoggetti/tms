# tms - Tmux Session Manager

A simple and interactive tmux session manager built with fzf.

## Description

tms provides an easy way to manage your tmux sessions through an interactive interface:
- Create new sessions from any directory
- Attach to existing sessions
- Detach from current session
- Kill sessions
- Automatically launches your editor in the first window

## Features

- Interactive interface with fzf
- Automatic editor launch in first window
- Smart session switching (inside or outside tmux)
- Simple navigation

## Prerequisites

- tmux
- fzf
- bash

## Installation

1. Clone or download the script:
```bash
git clone https://github.com/hugopoggetti/tms
cd tms && chmod +x tms && ./tms
```

2. create tmux bind:
```tmux
# Add tmux bind
bind-key t display-popup -E -w 80% -h 80% "bash -i ~/path/to/tms.sh"
```

## Configuration

Edit the variables at the top of the script:
```bash
BASE_DIRECTORY="$HOME/"          # Base directory for search
EDITOR="$EDITOR"                 # Editor to launch
DEFAULT_TMUX_FIRST_WINDOW="1"    # First tmux window id
INSTALL_PATH="/bin/tms"          # Install path
```

## Usage

Run the script:
```bash
tms
```
## License

MIT

## Contributing

Contributions are welcome. Please open an issue or submit a pull request.
