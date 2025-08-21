# Vim cheatsheet

This cheatsheet is a quick reference guide for Vim. It describes commands and shortcuts to help you navigate and edit text efficiently.

## Vertical movement

This section covers vertical movement commands in Vim. You can use these commands to navigate through lines and screens in your text file.

| Key            | Action                       |
|----------------|------------------------------|
| j              | Move down one line           |
| k              | Move up one line             |
| XXj            | Move down XX lines (works with h,j,k,l) |
| Ctrl + f       | Move forward one screen      |
| Ctrl + b       | Move backward one screen     |
| gg             | Move to first line of file   |
| XXgg           | Move to line XX of file      |
| G              | Move to last line of file    |
| H              | Move to top of screen        |
| M              | Move to middle of screen     |
| L              | Move to bottom of screen     |
| zz             | Center current line in window |
| zt             | Move current line to top of window |
| zb             | Move current line to bottom of window |

## Horizontal movement

This section covers horizontal movement commands in Vim. You can use these commands to navigate through characters and words in your text file.

| Key            | Action                       |
|----------------|------------------------------|
| h              | Move left one character      |
| l              | Move right one character     |
| w              | Move forward one word        |
| W              | Move forward one word (continuous text) |
| b              | Move backward one word       |
| B              | Move backward one word (continuous text) |
| e              | Move to end of word          |
| ge             | Move to end of previous word |
| 0              | Move to beginning of line    |
| _              | Move to first non-blank character of line |
| $              | Move to end of line          |
| fX             | Move to next occurrence of character X in line |
| FX             | Move to previous occurrence of character X in line |
| ;              | Repeat last f/F command      |
| ,              | Repeat last f/F command in reverse |
| viX            | Visual select inside X (X can be an enclosing character like {}, [], (), etc.) |

## Jumping around

This section covers commands for jumping around in your text file. You can use these commands to quickly navigate to different locations in your file.

| Key            | Action                       |
|----------------|------------------------------|
| Ctrl + o       | Jump to previous location    |
| Ctrl + i       | Jump to next location        |
| {}             | Jump to previous/next paragraph |
| g + ;          | Jump to last change          |
| ma-z           | Mark current position with letter a-z in current buffer |
| mA-Z           | Mark current position with letter A-Z in all buffers |
| 'X             | Jump to mark X               |

## Editing text

This section covers commands for editing text in Vim. You can use these commands to insert, delete, copy, and paste text in your file.

| Key            | Action                       |
|----------------|------------------------------|
| i              | Insert before cursor         |
| I              | Insert at beginning of line  |
| a              | Insert after cursor          |
| A              | Insert at end of line        |
| o              | Open new line below current line |
| O              | Open new line above current line |
| cM             | Replace with M as motion (e.g., cw, c$, c0, etc.) |
| x              | Delete character under cursor |
| X              | Delete character before cursor |
| dd             | Delete current line          |
| dM             | Delete with M as motion (e.g., dw, d$, d0, etc.) |
| D              | Delete to end of line        |
| yy             | Copy current line            |
| yM             | Copy with M as motion (e.g., yw, y$, y0, etc.) |
| p              | Paste after cursor           |
| P              | Paste before cursor          |
| u              | Undo last change             |
| Ctrl + r       | Redo last change             |
| Ctrl + v       | Select block of text, then Shift + I to insert on all lines |

## Search and replace

This section covers commands for searching and replacing text in Vim. You can use these commands to find specific patterns or words in your file.

| Key            | Action                       |
|----------------|------------------------------|
| *              | Search forward for word under cursor |
| #              | Search backward for word under cursor |
| /              | Search forward for pattern   |
| ?              | Search backward for pattern  |
| n              | Repeat last search in same direction |
| N              | Repeat last search in opposite direction |
| :s/old/new/g   | Replace all occurrences of "old" with "new" in current line |
| :%s/old/new/g  | Replace all occurrences of "old" with "new" in entire file |
| :%s/old/new/gc | Replace all occurrences of "old" with "new" in entire file with confirmation |

## Resources

Here are some resources to help learn Vim:

- https://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/
- https://www.youtube.com/watch?v=ibNvyTD4Icg
- https://www.youtube.com/watch?v=wlR5gYd6um0
- https://www.youtube.com/watch?v=Qem8cpbJeYc
