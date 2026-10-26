# Clipboard-to-ChatGPT

A small Bash script that sends the text currently copied to your
clipboard to ChatGPT, prints the response in the terminal, and copies
the response back to the clipboard.

It uses
[`kardolus/chatgpt-cli`](https://github.com/kardolus/chatgpt-cli), a
command-line client for interacting with OpenAI and other language-model
providers.

## How it works

1.  Reads clipboard text with `xsel`.
2.  Stops with an error if the clipboard is empty.
3.  Sends the text to the `chatgpt` command using the `gpt-4o` model.
4.  Prints the response.
5.  Copies the response to the clipboard.

## Requirements

-   Bash
-   [`xsel`](https://github.com/kfish/xsel) for clipboard access
-   [`kardolus/chatgpt-cli`](https://github.com/kardolus/chatgpt-cli)
    installed, with the `chatgpt` executable available on your `PATH`
-   An OpenAI API key

## Installation

### 1. Install `xsel` (Linux)

On Debian or Ubuntu:

``` bash
sudo apt update
sudo apt install xsel
```

Use your distribution's package manager if you are on another Linux
distribution.

### 2. Download and install the ChatGPT terminal tool

Follow the latest instructions in the [official `chatgpt-cli`
repository](https://github.com/kardolus/chatgpt-cli#installation).

For Linux on **AMD64/x86-64**, you can download the prebuilt binary
with:

``` bash
curl -L -o chatgpt https://github.com/kardolus/chatgpt-cli/releases/latest/download/chatgpt-linux-amd64
chmod +x chatgpt
sudo mv chatgpt /usr/local/bin/
```

For Linux on **ARM64**, use the `chatgpt-linux-arm64` release asset
instead. The repository also provides installation options for macOS and
other platforms.

Verify that the command is installed:

``` bash
command -v chatgpt
chatgpt --help
```

### 3. Configure your OpenAI API key

This CLI uses `OPENAI_API_KEY`. Set it in your shell, or add the
following line to your shell profile (such as `~/.bashrc`) and restart
your terminal:

``` bash
export OPENAI_API_KEY="your_api_key_here"
```

Get your API key through your OpenAI account. **Do not commit a real API
key to this repository.**

The provided script originally uses `OPENAI_KEY`, which is not the
environment variable documented by `kardolus/chatgpt-cli`. Update the
script to use `OPENAI_API_KEY` (or configure the variable expected by
your installed CLI) before running it.

## Usage

Save the Bash script as `clipboard-chatgpt.sh`, make it executable, and
run it:

``` bash
chmod +x clipboard-chatgpt.sh
./clipboard-chatgpt.sh
```

Copy the text you want to send before running the script. The response
will be displayed in the terminal and placed on your clipboard.

## Troubleshooting

-   **`xsel: command not found`** --- install `xsel`.
-   **`chatgpt: command not found`** --- install
    [`kardolus/chatgpt-cli`](https://github.com/kardolus/chatgpt-cli)
    and ensure the binary is on your `PATH`.
-   **Empty clipboard** --- copy some text and run the script again.
-   **Authentication error** --- check that `OPENAI_API_KEY` is set
    correctly.
-   **Model or flag error** --- run `chatgpt --help` and consult the
    CLI's [official
    documentation](https://github.com/kardolus/chatgpt-cli) for
    supported options.

## Security and privacy

-   The script sends the clipboard contents to the configured AI
    provider. Do not run it with passwords, API keys, or confidential
    information unless you intend to submit that data.
-   Keep API keys out of source control. Configure credentials in your
    shell environment or another secure method.

## License

Add the license that applies to this repository.
