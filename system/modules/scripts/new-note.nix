{ pkgs }:

# Create a new note in my Obsidian vault
pkgs.writeShellScriptBin "n" ''
  #!/bin/sh
  # Define the notes directory
  NOTES_DIR=~/documents/notes/0_inbox

  # Ensure the directory exists
  mkdir -p "$NOTES_DIR"

  # Ask for the title
  read -p "Insert a title: " TITLE

  # Replace spaces with underscores and append .md extension
  SUFFIX=$(echo "$TITLE" | tr ' ' '-' | tr -cd '[:alnum:]-')
  TIMESTAMP=$(date +%s)
  FILENAME="$TIMESTAMP-$SUFFIX.md"

  # Full path for the new note
  FILEPATH="$NOTES_DIR/$FILENAME"

  # Create the file and add the frontmatter
  cat <<EOL > "$FILEPATH"
  ---
  id: $FILENAME
  aliases:
    - $TITLE
  tags: []
  ---
  # $TITLE

  EOL

  # Open the file with Neovim
  nvim "$FILEPATH"
''
