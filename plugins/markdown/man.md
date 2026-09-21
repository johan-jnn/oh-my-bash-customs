# markdown

Pretty-print markdown to terminal

## Usage

### Print a file

```sh
markdown ./readme.md
markdown /docs/hello.md

# Fails if the file does not exist (it does not check for file extension/format)
markdown unexistant.md
```

### Print from stdin/piping

```sh
echo "# This is a title" | markdown
echo "$(cat <<MD
# My title

- This
- Is
- Also
- Possible
MD
)" | markdown
```

## Author

Made by [Johan JANIN](https://johan-janin.com) by using [Bun's markdown module](https://bun.com/reference/bun/markdown/ansi).
