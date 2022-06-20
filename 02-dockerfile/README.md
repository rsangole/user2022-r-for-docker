* FROM - Defines the base image to use for the build of the following 
stages.  A valid docker will always start with FROM instruction.
* ARG - Defines variables that can be pass to the image during the build time
* ENV - Sets the image environment variables
* LABEL - Enables to add information about the image to the image’s metadata, such as authors, maintainers, license, etc
* RUN - Enables to execute commend lines commands during the image build time 
* COPY - Enables to copy files from your local system to the image
- EXPOSE - Defines the port on the container to listen during run time.
- CMD - Enables to run commands during the run time (unlike RUN which run during the build time).
- ENDRYPOINT - Enables to run commands during the run time with arguments.
- VOLUME - Sets the a mount point inside the image which can be linked with external volume (e.g., local directory).
- WORKDIR - Defines the work directory inside the image for any RUN, CMD, ENTRYPOINT, COPY, and ADD commands

Reference - https://docs.docker.com/reference/
