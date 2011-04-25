VERSION := $(shell perl -MExtUtils::MakeMaker -le 'print MM->parse_version(shift)' vmm)
DEBFACTORY := DebFactory

README: vmm
	pod2text vmm >README
	git add README
	git commit -m 'Auto update from POD'

commit: README
	-git commit -a

push: commit
	git push

version:
	echo "VERSION IS $(VERSION)"

clean:
	-rm -r $(DEBFACTORY)

deb:
	mkdir $(DEBFACTORY)
	mkdir -p $(DEBFACTORY)/usr/bin $(DEBFACTORY)/usr/share/man $(DEBFACTORY)/usr/share/doc/vmm
	cp -a vmm $(DEBFACTORY)/usr/bin
	cp -a docs/vmmrc.example $(DEBFACTORY)/usr/share/doc/vmm
	cp -ar Distro/DEBIAN $(DEBFACTORY)
	perl -pi -e 's/\$$VERSION/$(VERSION)/' $(DEBFACTORY)/DEBIAN/control
	pod2man vmm $(DEBFACTORY)/usr/share/man/vmm.1
	gzip -f $(DEBFACTORY)/usr/share/man/vmm.1
	dpkg -b $(DEBFACTORY) vmm_$(VERSION).deb
	mv vmm_$(VERSION).deb Distro
	make clean
