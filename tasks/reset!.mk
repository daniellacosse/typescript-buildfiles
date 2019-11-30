.PHONY: reset reset!

reset:
	@echo "Are you sure? - please run 'task/reset!' to confirm."

reset!:
	@rm -rf $(ARTIFACT_FOLDER)
