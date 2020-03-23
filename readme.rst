Steps to reproduce::

    # Install the custom mimetype.
    $ make install
    # Open it with kde-open5.
    $ make open-kde

Expected result: ``kde-open5`` opens ``example.fcyzqrpw`` in ``xedit``.

Actual result: ``kde-open5`` shows a "Choose Application - KIO Client" window
and can't save any persistent default application.

Manual steps to reproduce::

    xdg-mime install --mode user x-fcyzqrpw.xml
    desktop-file-install --dir=~/.local/share/applications/ fcyzqrpw.desktop
    chmod +x ~/.local/share/applications/fcyzqrpw.desktop
    xdg-mime default fcyzqrpw.desktop application/x-fcyzqrpw
    update-desktop-database ~/.local/share/applications
    update-mime-database ~/.local/share/mime
    mv ~/.local/share/mime/application ~/.local/share/mime/application.real
    ln -s -r ~/.local/share/mime/application.real ~/.local/share/mime/application
    kde-open5 example.fcyzqrpw

Required packages (on Kubuntu 18.04)::

    sudo apt install make desktop-file-utils
