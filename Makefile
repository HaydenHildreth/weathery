PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin

install:
	install -d $(BINDIR)
	install -m 755 src/weathery.sh $(BINDIR)/weathery
	chmod +x $(BINDIR)/weathery

uninstall:
	rm -f $(BINDIR)/weathery