Steps to reproduce::

    # Install the custom mimetype.
    $ make install
    # Open it with kde-open5.
    $ make open-kde

Manual steps to reproduce::

    xdg-mime install --mode user x-fcyzqrpw.xml
    desktop-file-install --dir=~/.local/share/applications/ fcyzqrpw.desktop
    chmod +x ~/.local/share/applications/fcyzqrpw.desktop
    xdg-mime default fcyzqrpw.desktop application/x-fcyzqrpw
    update-desktop-database ~/.local/share/applications
    update-mime-database ~/.local/share/mime
    kde-open5 example.fcyzqrpw
