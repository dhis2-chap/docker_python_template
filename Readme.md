

# Template for R docker image for climate/health predictions

This is a template for creating a Docker image with custom R packages. 

This template is based on a base image that has the INLA packaged already installed, which saves a lot of time compared to installing it from source.

### How to use

1. Fork this repository and checkout the code locally
2. Decide on a name for the image you want to build. Edit the file `.githbub/workflows/build.yml` and make sure `IMAGE_NAME` points to your name.
3. If you want, change how the Github action is being run. Currently, it runs on every push to the `master` branch (NB: Change this to `main` if you branch is called `main`).
3. Edit Dockerfile. The file contains an example of how to add an R package
4. Push the repository to Github. You should create a repository on Github first, add the correct remote and then push.

If everything works, a Github action will start running after you push. If nothing fails, an Image will be pushed to the Github package registry. The name will be  `ghcr.io/dhis2-chap/docker_r_inla`. 

In order to make it possible for anyone to use the image without authentication, you have to make the image public. On the left side in the front page of the repository you created, you will see the package. Click Package settings and edit visibility. 

To verify that the image exists and is available to the public, you can run `docker pull ghcr.io/ORGANIZATION/IMAGE_NAME:master`.

Tip: It can be a good idea to add new lines for every package you want to install in the Dockerfile, to make use of Docker's caching.

