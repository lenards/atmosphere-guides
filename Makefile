.DEFAULT_GOAL = all
.PHONY = all clean

all: guides

commit: guides pages-commit

guides: install_guide staff_guide user_guide imaging_guide

install_guide:
	./scripts/compile_guide.sh install_guide

staff_guide:
	./scripts/compile_guide.sh staff_guide

user_guide:
	./scripts/compile_guide.sh user_guide

imaging_guide:
	./scripts/compile_guide.sh imaging_guide

pages-commit:
	git subtree push --prefix dist origin gh-pages
