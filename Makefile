export DOTFILES_ROOT=$(shell pwd)
export XDG_CONFIG_HOME=${HOME}/.config

oscheck:
	@echo "\033[0;34mRun oscheck.sh\033[0m"
	@scripts/oscheck.sh
	@echo "\033[0;32mDone.\033[0m"

.PHONY: init
init: oscheck
	@echo "\033[0;34mRun xcode.sh\033[0m"
	@xcode-select --install >/dev/null
	@echo "\033[0;32mDone.\033[0m"

brew: oscheck
	@echo "\033[0;34mRun brew.sh\033[0m"
	@scripts/brew.sh
	@echo "\033[0;32mDone.\033[0m"

# .PHONY: vscode
# vscode:
# 	@echo "\033[0;34mStart Linking vscode settings\033[0m"
# 	@cp "/Users/$(whoami)/Library/Application Support/Code/User/*.json" backup/
# 	@ln -snfv vscode/*.json "/Users/$(whoami)/Library/Application Support/Code/User"
# 	@echo "\033[0;32mDone.\033[0m"

links:
	@echo "\033[0;34mRun links.sh\033[0m"
	@scripts/links.sh
	@echo "\033[0;32mDone.\033[0m"

backup:
	@echo "\033[0;34mRun backup.sh\033[0m"
	@scripts/backup.sh
	@echo "\033[0;32mDone.\033[0m"

commit:
	@echo "\033[0;34mCommit dotfiles to repo\033[0m"
	@git add .
	@git commit -m
	@echo "\033[0;32mDone.\033[0m"

test: backup links



# link:
#     @echo "Linking dotfiles..."
#     for f in $(LINK_DIRS); do \
#         ln -sf "$(DOTFILES_DIR)/$f" ~/"$f" || true; \
#     done

# BACKUP_DIR := backup
# backup:
#     @echo "Backing up dotfiles..."
#     mkdir -p $(BACKUP_DIR)
#     cp -r * $(BACKUP_DIR)/$(shell date +"%Y-%m-%d_%H-%M-%S")

# clone:
#     git clone https://github.com/your_username/your_dotfiles.git .

# commit:
#     git add -A
#     git commit -m "Update dotfiles"
#     git push

# update:
#     git pull

.PHONY: all
all: init brew backup links
