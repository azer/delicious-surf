# delicious surf - the web browser customized for delicious.com
# See LICENSE file for copyright and license details.

include config.mk

SRC = delicious-surf.c
OBJ = ${SRC:.c=.o}

build: options delicious-surf
	@rm -rf ~/.opt/delicious-surf
	@mkdir -p /home/${USER}/.opt/delicious-surf
	@cp ./opt/* ~/.opt/delicious-surf/.

	@mkdir -p /home/${USER}/.local/share/delicious-surf
	@touch /home/${USER}/.local/share/delicious-surf/history
	@touch /home/${USER}/.local/share/delicious-surf/logs
	@cp share/* /home/${USER}/.local/share/delicious-surf

options:
	@echo surf build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	@echo creating $@ from config.def.h
	@cp config.def.h $@

clean:
	@echo cleaning
	@rm -f delicious-surf ${OBJ} delicious-surf-${VERSION}.tar.gz

delicious-surf: ${OBJ}
	@echo CC -o $@
	@${CC} -o $@ delicious-surf.o ${LDFLAGS}

dist: clean
	@echo creating dist tarball
	@mkdir -p surf-${VERSION}
	@cp -R LICENSE Makefile config.mk config.def.h README \
		delicious-surf.1 ${SRC} delicious-surf-${VERSION}
	@tar -cf delicious-surf-${VERSION}.tar surf-${VERSION}
	@gzip delicious-surf-${VERSION}.tar
	@rm -rf delicious-surf-${VERSION}

sync:
	@echo -n "Type Your Delicious.com Username: "
	@read delicious_user; \
	echo "user=\""$$delicious_user"\"" > ~/.delicious-surf

	@read -s -p "Password: " delicious_passwd; \
	echo "passwd=\""$$delicious_passwd"\"" >> ~/.delicious-surf

	@echo "opt=\"~/.opt/delicious-surf\"" >> ~/.delicious-surf
	@echo "share=\"~/.local/share/delicious-surf\"" >> ~/.delicious-surf

	@echo "Synchronizing local bookmarks file..."
	@sh ~/.opt/delicious-surf/sync.sh

install: all
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f delicious-surf ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/delicious-surf
	@echo installing manual page to ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@sed "s/VERSION/${VERSION}/g" < delicious-surf.1 > ${DESTDIR}${MANPREFIX}/man1/delicious-surf.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/delicious-surf.1

	@echo "Done."

uninstall:
	@echo removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/delicious-surf
	@echo removing manual page from ${DESTDIR}${MANPREFIX}/man1
	@rm -f ${DESTDIR}${MANPREFIX}/man1/delicious-surf.1
	@rm -rf ~/.opt/delicious-surf

.PHONY: all options clean dist install uninstall
