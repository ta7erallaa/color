# colors.sh

A lightweight and minimal Bash library to apply ANSI color formatting and text attributes
to terminal output.

## Features

- Named color functions for clear, readable terminal output
- Supports text attributes: bold, italic, underline, blink, etc.
- Clean inline usage: `echo "$(Red \"text\")"` or for docs: `Red "Some description\n"`
- Automatic color reset using Bash trap (like `defer`)

## Installation

Just source the script in your shell or script:

```bash
source /path/to/colors.sh
```

## Usage

You can use the color functions directly in command substitution, allowing inline styling:

```bash
echo "$(Red "Error:" $Bold) Something went wrong"
echo "$(Green "Success" $Underline)"
echo "$(Blue "Info")"
```

Or use them directly for documentation:

```bash
Red "This is a red message\n"
Cyan "Another line in cyan\n"
```

### Available Foreground Colors

| Color Name | Code |
| ---------- | ---- |
| Black      | 30   |
| Red        | 31   |
| Green      | 32   |
| Yellow     | 33   |
| Blue       | 34   |
| Magenta    | 35   |
| Cyan       | 36   |
| White      | 37   |

### Text Attributes (Optional Second Argument)

| Attribute     | Code |
| ------------- | ---- |
| Bold          | 1    |
| Faint         | 2    |
| Italic        | 3    |
| Underline     | 4    |
| Blink (slow)  | 5    |
| Blink (rapid) | 6    |
| Reverse Video | 7    |
| Concealed     | 8    |
| Crossed Out   | 9    |

### Example

```bash
#!/usr/bin/env bash
source ./colors.sh

echo "$(Red "[ERROR]" $Bold) Something failed."
echo "$(Green "[OK]" $Underline) Task completed."

echo
Yellow "Warning: disk space low\n"
```

## Notes

- If `format` is missing or a number (`"1"`), the script will print an error and return
`1`.
- All formatting automatically resets after each call.

## Credits

- [@ta7erallaa](https://www.github.com/ta7erallaa).
- Inspired by [fatih](https://github.com/fatih) and his approach in the Golang
[color](https://github.com/fatih/color) package.

## License

![License](https://img.shields.io/badge/License-MIT-green/github/license/ta7erallaa/color)
