# tms - Tmux Session Manager

A simple and interactive tmux session manager built with fzf.

## Description

tms provides an easy way to manage your tmux sessions through an interactive interface:
- Create new sessions from any directory
- Attach to existing sessions
- Kill sessions
- Automatically launches your editor in the first window

## Prerequisites

- tmux
- fzf
- bash

## Installation

1. Clone or download the script:
```bash
git clone https://github.com/hugopoggetti/tms
cd tms
```

2. Make the script executable:
```bash
chmod +x tms
```

3. Add to your PATH or create an alias:
```bash
# Add to your ~/.bashrc or ~/.zshrc
export PATH="$PATH:/path/to/tms"

# Add tmux bind
bind-key t display-popup -E -w 80% -h 80% "bash -i ~/path/to/tms.sh"
```

## Configuration

Edit the variables at the top of the script:
```bash
base_directory="$HOME/"              # Base directory for search
editor="$EDITOR"                     # Editor to launch
default_tmux_first_window="1"       # First window number
```

## Usage

Run the script:
```bash
tms
```

### Menu Options

- **NEW-SESSION**: Create a new session from a directory
- **ATTACH**: Attach to an existing session
- **KILL-SESSION**: Kill a running session
- **EXIT**: Quit the manager

Press `ESC` to cancel and return to the menu.

## Features

- Interactive interface with fzf
- Automatic editor launch in first window
- Smart session switching (inside or outside tmux)
- Simple navigation

## License

MIT

## Contributing

Contributions are welcome. Please open an issue or submit a pull request.
