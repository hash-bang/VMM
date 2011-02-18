README: vmm
	pod2text vmm >README
	git add README
	git commit -m 'Auto update from POD'

push: docs
	git push
