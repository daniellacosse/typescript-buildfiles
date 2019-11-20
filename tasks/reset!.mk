.PHONY: reset reset!

reset:
	@echo "Are you sure? - please run 'reset!' to confirm."

reset!:
	@rm -rf $(PROXY_FOLDER)
