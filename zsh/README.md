# ZSH and OhMyZsh

## Custom Themes
### Agnoster
With the agnoster theme, the terminal's prompt line can get long quickly when working in a git repository with multiple nested directories.
The custom theme in this repo add's functionality to only show the current directory and the current git branch when in a git repository. Otherwise, it will show all parent directories back to `$HOME`

Relevant code in the `prompt_dir` function
