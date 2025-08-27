

# Template for python docker image for typical chap-compatible python models


### How to use

1. Make a fork of this repository, and give it a suitable name (e.g. docker_for_some_model). Clone the repository locally. Make sure to enable Github actions in the cloned repo (Go to Settings->Actions->General in the new repo).
2. Decide on a name for the image you want to build. Edit the file `.githbub/workflows/build.yml` and make sure `IMAGE_NAME` points to your name. Note that upper case letters will be converted to lower case.
3. If you want, change how the Github action is being run. Currently, it runs on every push to the `master` branch (NB: Change this to `main` if your branch is called `main`).
3. Edit Dockerfile or requirements.txt to match what you need.
4. Push the repository to Github. You should create a repository on Github first, add the correct remote and then push.

If everything works, a Github action will start running after you push. If nothing fails, an Image will be pushed to the Github package registry. The name will be  `ghcr.io/dhis2-chap/[IMAGE_NAME]. 

In order to make it possible for anyone to use the image without authentication, you have to make the image public. On the right side in the front page of the repository you created, you will see the package. Click Package settings and edit visibility. 

To verify that the image exists and is available to the public, you can run `docker pull ghcr.io/ORGANIZATION/IMAGE_NAME:master`.
