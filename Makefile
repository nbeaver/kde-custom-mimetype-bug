MIMETYPE:=application/x-fcyzqrpw
MIMEINFO:=x-fcyzqrpw.xml
DESKTOP:=fcyzqrpw.desktop
FCYZQRPW:=example.fcyzqrpw

.PHONY: open
open :
	xdg-open $(FCYZQRPW)

.PHONY: open-kde
open-kde :
	kde-open5 $(FCYZQRPW)

.PHONY: open-gio
open-gio :
	gio open $(FCYZQRPW)

.PHONY: open-xfce
open-xfce :
	exo-open $(FCYZQRPW)

.PHONY: get-mimetype
get-mimetype :
	-xdg-mime query filetype $(FCYZQRPW)
	-mimetype $(FCYZQRPW)
	-gio info -a 'standard::content-type' $(FCYZQRPW)
	-file -i $(FCYZQRPW)

check-handler:
	-xdg-mime query default $(MIMETYPE)
	-gio mime $(MIMETYPE)

.PHONY: install
install :
	xdg-mime install --mode user $(MIMEINFO)
	desktop-file-install --dir=$(HOME)/.local/share/applications/ $(DESKTOP)
	chmod +x $(HOME)/.local/share/applications/$(DESKTOP)
	xdg-mime default $(DESKTOP) $(MIMETYPE)
	update-desktop-database ~/.local/share/applications
	update-mime-database ~/.local/share/mime
	bash symlink.sh

.PHONY: uninstall
uninstall :
	rm -f $(HOME)/.local/share/applications/$(DESKTOP)
	xdg-mime uninstall --mode user $(MIMEINFO)
	bash undo-symlink.sh
