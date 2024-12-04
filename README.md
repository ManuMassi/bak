# bak
Bash functions to add in the .bashrc or .zshrc that allow to easily create/delete backups of a file

## Usage
```
bak filename
```
This will create a copy of the file and add the ".bak" extension to the filename (while keeping the original file format)


```
unbak filename.bak
```
This will remove the .bak extension from the backup file (*overwriting the original file*)

