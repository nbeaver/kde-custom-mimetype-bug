#! /usr/bin/env bash

if ! test -L ~/.local/share/mime/application
then
    printf '~/.local/share/mime/application is not a symlink.\n'
    exit 1
fi
if ! test -e  ~/.local/share/mime/application.real
then
    printf '~/.local/share/mime/application.real does not exist.\n'
    exit 1
fi
if ! rm ~/.local/share/mime/application
then
    exit 1
fi
if ! mv ~/.local/share/mime/application.real ~/.local/share/mime/application
then
    exit 1
fi
