PREFIX ?= /usr
BSPWM ?= $(PREFIX)/bin/bspwm
STARTPLASMA ?= $(PREFIX)/bin/startplasma-x11

build:
	m4 -D BSPWM=$(BSPWM) bspwm-plasma-session.sh.m4 > bspwm-plasma-session.sh
	m4 -D PREFIX=$(PREFIX) -D STARTPLASMA=$(STARTPLASMA) bspwm-plasma.desktop.m4 > bspwm-plasma.desktop

install: build
	install -Dm755 bspwm-plasma-session.sh $(DESTDIR)/$(PREFIX)/bin/bspwm-plasma-session
	install -Dm644 bspwm-plasma.desktop $(DESTDIR)/$(PREFIX)/share/xsessions/bspwm-plasma.desktop
	install -Dm644 README.md $(DESTDIR)/$(PREFIX)/share/doc/bspwm-plasma-session/README.md
	install -Dm644 UNLICENSE.md $(DESTDIR)/$(PREFIX)/share/licenses/bspwm-plasma-session/UNLICENSE.md

clean:
	rm -f bspwm-plasma.desktop
	rm -f bspwm-plasma-session.sh

uninstall:
	rm -f $(DESTDIR)/$(PREFIX)/bin/bspwm-plasma-session
	rm -f $(DESTDIR)/$(PREFIX)/share/xsessions/bspwm-plasma.desktop
	rm -rf $(DESTDIR)/$(PREFIX)/share/doc/bspwm-plasma-session
	rm -rf $(DESTDIR)/$(PREFIX)/share/licenses/bspwm-plasma-session

