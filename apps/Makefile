GAMES := snake connectfour solitaire tetris flappybird pacman alltheapps
ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
EXEC_PATH := target/thumbv7em-none-eabihf/release
NWA_DIR := $(CURDIR)/nwa

build:
	mkdir -p $(NWA_DIR)
	@$(foreach dir, $(GAMES), \
		cd $(ROOT_DIR)$(dir) && \
		cargo update && \
		cargo build --release && \
		touch $(NWA_DIR)/$(dir).nwa && \
		cp -v $(ROOT_DIR)$(dir)/$(EXEC_PATH)/$(dir) $(NWA_DIR)/$(dir).nwa; \
		)
clean:
	$(foreach dir, $(GAMES), \
		rm -f $(NWA_DIR)/$(dir).nwa; \
		cd $(ROOT_DIR)$(dir); \
		cargo clean;)
