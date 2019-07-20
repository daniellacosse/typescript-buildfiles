include main.mk

.PHONY: container image docker-online

# -- container --

IMAGE_NAME=typescript-project

CONTAINER_PORT=3000
CONTAINER_LOCALHOST=http://localhost:$(CONTAINER_PORT)/

# container has no proxy target so you can reset the process by running `make` again
container: image
	container_id=$$(docker ps -aqf "name=$(IMAGE_NAME)") ;\
	\
	if [ $$container_id ]	;\
		then docker stop $$container_id ;\
	fi ;\
	\
	docker run --rm -dit \
		--name=$(IMAGE_NAME) \
		-p $(CONTAINER_PORT):$(CONTAINER_PORT)/tcp \
		$(IMAGE_NAME):latest ;\
	\
	open $(STORY_LOCALHOST)

# -- image --

IMAGE_PROXY_TARGET=$(PROXY_FOLDER)/image

image: $(PROXY_FOLDER) docker-online
	make $(IMAGE_PROXY_TARGET)

$(IMAGE_PROXY_TARGET): $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(SOURCE_FILES) Dockerfile
	docker build . -t $(IMAGE_NAME):latest \
		> $(IMAGE_PROXY_TARGET)

# -- docker online --

docker-online: $(PROJECT_DEPENDENCY_PROXY_TARGETS)
	$(call IF_PRODUCTION,exit 0) ;\
	if ! docker stats --no-stream ;\
		then echo "Starting docker..." ;\
		\
		open /Applications/Docker.app/ ;\
		\
		while ! docker stats --no-stream; do sleep 1; done ;\
	fi ;\
	\
	echo "Docker online!"
