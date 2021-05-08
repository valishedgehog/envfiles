# Vim notes

Install neovim and requirements:
```bash
sudo apt update
sudo apt install neovim python3-neovim exuberant-ctags git curl
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Key bindings
```
F2 - nerdtree
F8 - vim tags
F9 - fold/unfold
```

## Vim eunuch {[tpope/vim-eunuch](https://github.com/tpope/vim-eunuch)}
```
Vim sugar for the UNIX shell commands that need it the most. Features include:

:Delete: Delete a buffer and the file on disk simultaneously.
:Unlink: Like :Delete, but keeps the now empty buffer.
:Move: Rename a buffer and the file on disk simultaneously.
:Rename: Like :Move, but relative to the current file's containing directory.
:Chmod: Change the permissions of the current file.
:Mkdir: Create a directory, defaulting to the parent of the current file.
:Cfind: Run find and load the results into the quickfix list.
:Clocate: Run locate and load the results into the quickfix list.
:Lfind/:Llocate: Like above, but use the location list.
:Wall: Write every open window. Handy for kicking off tools like guard.
:SudoWrite: Write a privileged file with sudo.
:SudoEdit: Edit a privileged file with sudo.

File type detection for sudo -e is based on original file name.
New files created with a shebang line are automatically made executable.
```

## Vim Move {[matze/vim-move](https://github.com/matze/vim-move)}
```
>>> A = alt
<A-k>   Move current line/selection up
<A-j>   Move current line/selection down
<A-h>   Move current character/selection left
<A-l>   Move current character/selection right
```

## Vim Move {[mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi)}
```
Basic usage:

    select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
    create cursors vertically with Ctrl-Down/Ctrl-Up
    select one character at a time with Shift-Arrows
    press n/N to get next/previous occurrence
    press [/] to select next/previous cursor
    press q to skip current and get next occurrence
    press Q to remove current cursor/selection
    start insert mode with i,a,I,A

Two main modes:

    in cursor mode commands work as they would in normal mode
    in extend mode commands work as they would in visual mode
    press Tab to switch between «cursor» and «extend» mode

Most vim commands work as expected (motions, r to replace characters, ~ to change case, etc). Additionally you can:

    run macros/ex/normal commands at cursors
    align cursors
    transpose selections
    add patterns with regex, or from visual mode

And more... of course, you can enter insert mode and autocomplete will work.
```
