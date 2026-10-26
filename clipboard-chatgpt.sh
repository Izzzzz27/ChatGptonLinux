#!/bin/bash

# Set your OpenAI API key directly here
export OPENAI_KEY=""

# Get the last copied text from the clipboard using xsel
PROMPT=$(xsel --clipboard --output)

# Ensure the clipboard content was retrieved
if [ -z "$PROMPT" ]; then
  echo "Clipboard is empty. Copy some text and try again."
  exit 1
fi

# Pass the clipboard content to chatgpt
RESULT=$(echo "$PROMPT" | chatgpt --model gpt-4o)

# Print the result to the terminal
echo "$RESULT"

# Copy the result to the clipboard using xsel
echo -n "$RESULT" | xsel --clipboard --input

# Confirm if xsel worked
if [ $? -eq 0 ]; then
  echo "Response successfully copied to clipboard."
else
  echo "Failed to copy response to clipboard. Check if xsel is installed and working."
  exit 1
fi
