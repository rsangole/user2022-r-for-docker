 YOUR_LOCAL_PROJECT_FOLDER="/Users/rahul/github/github.com/user2022-r-for-docker/04-docker-and-r/03-develop-in-docker/"

 docker run \
 	--rm \
	-it \
	-p 8787:8787 \
	-e DISABLE_AUTH="true" \
	-v $YOUR_LOCAL_PROJECT_FOLDER:/home/rstudio \
	docker_for_r/rstudio:v1.0