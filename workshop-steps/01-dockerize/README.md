
How to dockerize a PHP app? I don't know myself.

Let's try this:

https://github.com/docker/docker-php-sample

## do we even need to dockerize it?

* Check out   BuildPacks on GCP: https://cloud.google.com/docs/buildpacks/build-application
* Install `pack`: https://buildpacks.io/docs/for-platform-operators/how-to/integrate-ci/pack/
* buildpacks in PHP: https://cloud.google.com/docs/buildpacks/php (where it tells you how to set up the PHP version)
* Try something like `pack build --builder=gcr.io/buildpacks/builder my-app-with-buildpacks`

## But I want to have control! I want Docker!

Makes sense.

* Sample PHP `Dockerfile`:  https://github.com/docker/docker-php-sample
* nope non va
