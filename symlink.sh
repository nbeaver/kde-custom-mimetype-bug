#! /usr/bin/env bash

if test -L ~/.local/share/mime/application
then
    printf '~/.local/share/mime/application is already a symlink.\n'
    exit 0
fi
if test -e  ~/.local/share/mime/application.real
then
    printf '~/.local/share/mime/application.real already exists.\n'
    exit 1
fi
if ! mv ~/.local/share/mime/application ~/.local/share/mime/application.real
then
    exit 1
fi
if ! ln -s -r ~/.local/share/mime/application.real ~/.local/share/mime/application
then
    exit 1
fi
