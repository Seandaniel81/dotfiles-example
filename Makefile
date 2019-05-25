#.PHONY: all
#all: bin dotfiles etc ## Installs the bin and etc directory files and the dotfiles.
#
#.PHONY: bin
#bin: ## Installs the bin directory files.
#	# add aliases for things in bin
#	for file in $(shell find $(CURDIR)/bin -type f -not -name "*-backlight" -not -name ".*.swp"); do \
#		f=$$(basename $$file); \
#		sudo ln -sf $$file /usr/local/bin/$$f; \
#	done

.PHONY: dotfiles
dotfiles: ## Installs the dotfiles.
	# add aliases for dotfiles
	# basename concat only the filename, .path from /Users/zachi.nachshon/code/dotfiles/.path
	for file in $(shell find $(PWD) -name ".*" -not -name ".gitignore" -not -name ".travis.yml" -not -name ".git" -not -name ".*.swp" -not -name ".gnupg" -not -name ".idea" -not -name "install"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \
#	ln -fn $(PWD)/gitignore $(HOME)/.gitignore;
#	git update-index --skip-worktree $(CURDIR)/.gitconfig;

.PHONY: brew-install
homebrew: ## Installs homebrew packages and casks.
	-@$(CURDIR)/install/brew/.brew-install

.PHONY: mac-install
mac-install: ## Installs MAC OSx defaults & key bindings.
	-@$(CURDIR)/install/mac/.mac-install

# Need to check before usage
#	ln -snf $(PWD)/.fonts $(HOME)/Library/Fonts;