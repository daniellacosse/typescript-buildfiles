NUXT_PATH=apps/nuxt
NUXT_FILES:=$(shell find $(NUXT_PATH) -type f -name '*')
NUXT_COMMON_FLAGS= $(NUXT_PATH) --modern --port $(NUXT_PORT) --open

nuxt/server: setup
	yarn nuxt $(NUXT_COMMON_FLAGS)

nuxt: setup $(NUXT_FILES)
	yarn nuxt build $(NUXT_COMMON_FLAGS)
