README: vmm
	pod2text vmm >README
	git add README
	git commit -m 'Auto update from POD'

commit: README
	git commit -a

push: commit
	git push
