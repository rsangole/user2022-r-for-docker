YOUR_LOCAL_RENV_CACHE_PATH="/Users/rahul/github/github.com/user2022-r-for-docker/04-docker-and-r/02d-using-renv-option-2/renv-cache"
YOUR_LOCAL_PROJECT_FOLDER="/Users/rahul/github/github.com/user2022-r-for-docker/04-docker-and-r/02d-using-renv-option-2/project_folder"
docker run \
	--rm \
	--volume $YOUR_LOCAL_RENV_CACHE_PATH:/renv/cache \
	--volume $YOUR_LOCAL_PROJECT_FOLDER:/home/work \
	-it \
	docker_for_r/package_example_renv_2:v1.0 \
	bash