delete:
	rm -rd prova

makedirs:
	mkdir prova
	mkdir prova/prova1
	mkdir prova/prova2
	mkdir prova/prova1/prova1a
	mkdir prova/prova1/prova1b
	mkdir prova/prova2/prova2a
	mkdir prova/prova2/prova2b

restore:
	make delete
	make makedirs

update:
	cp allsubf.sh /usr/local/bin/allsubf
	sudo chmod +x /usr/local/bin/allsubf

