help:
	@just -l

config:
	stow -v .

dotfile:
	stow -vt ~ dots

remove-dotfile:
	stow -vDt ~ dots

remove-config:
	stow -vD .

uninstall: remove-config remove-dotfile

install: config dotfile
