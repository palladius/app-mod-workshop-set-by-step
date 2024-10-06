
How to dockerize a PHP app? I don't know myself.

Let's try this:

https://github.com/docker/docker-php-sample

## do we even need to dockerize it?

* Check out   BuildPacks on GCP: https://cloud.google.com/docs/buildpacks/build-application and [here](https://cloud.google.com/docs/buildpacks/build-application#build_an_application_remotely)
* Install `pack`: https://buildpacks.io/docs/for-platform-operators/how-to/integrate-ci/pack/
* buildpacks in PHP: https://cloud.google.com/docs/buildpacks/php (where it tells you how to set up the PHP version)
* Try something like `pack build --builder=gcr.io/buildpacks/builder my-app-with-buildpacks`

## But I want to have control! I want Docker!

Makes sense.

* Docker for PHP on GCP: https://cloud.google.com/run/docs/quickstarts/build-and-deploy/deploy-php-service


## How do you do it?

* I've asked Gemini this question:

```
Errore di connessione: could not find driver
```
* Result: see `dockerize-gemini/`
* I just needed to change `COPY .` into `COPY app/` and it worked at first time!
* Yup, it's THAT simple!


## does it work?

Since we haven't configured the DB Yet, we get this error:

```
Errore di connessione: could not find driver
```

If you got here, it's a **SUCCESS**! On to the next chapter.


## URLography

* https://cloud.google.com/run/docs/quickstarts/build-and-deploy/deploy-php-service

## Caveats

* Error: **PDOException “could not find driver”**: if your dockerfile doesn't contain `pdo_mysql` this might happen. See [this article](https://stackoverflow.com/questions/2852748/pdoexception-could-not-find-driver).
