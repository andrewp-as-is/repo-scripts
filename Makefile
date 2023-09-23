USERNAME:=$(shell git config user.name)
REMOTE_URL:=git@github.com:$(USERNAME)/repo-scripts.git

all:
	# 1) create static copy to prevent accidental edit&commits
	rsync --delete -a scripts/ ~/.repo-scripts
	# 2) make symlinks
	find -H ~/git -type d -mindepth 1 -maxdepth 1 -exec ln -hfns ~/.repo-scripts {}/.scripts \;
