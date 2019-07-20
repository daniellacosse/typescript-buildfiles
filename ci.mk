include main.mk

.PHONY: ci

CI_CONFIG=.circleci/config.yml
LOCAL_CI_CONFIG=$(PROXY_FOLDER)/config.local.yml

# ci has no proxy target so you can run it multiple times w/ different jobs
ci: $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(LOCAL_CI_CONFIG) $(SOURCE_FILES)
	circleci local execute --job $(JOB) --config $(LOCAL_CI_CONFIG) \

$(LOCAL_CI_CONFIG): $(PROXY_FOLDER) $(CI_CONFIG)
	circleci config process $(CI_CONFIG) \
		> $(LOCAL_CI_CONFIG)
