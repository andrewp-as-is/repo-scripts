USERNAME:=$(shell git config user.name)
REMOTE_URL:=git@github.com:$(USERNAME)/repo-scripts.git

all:
	find -H ~/git -type d -mindepth 1 -maxdepth 1 ! -name "repo-scripts" -exec ln -hfns ~/git/repo-scripts/repo-scripts {}/.repo-scripts \;
	# known-issue: not expandable for this repo in IDE (Sublime)
	git init
	git add -A
	git commit -m 'new';:
	git remote add "origin" "$(REMOTE_URL)";:
	git push -f --all origin

