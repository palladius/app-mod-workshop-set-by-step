
We want to build this app for the cloud.

This means packaging th code in some sort of ZIP file which contains all the info to run it in the Cloud.

There are a few ways to package it:

* `docker`. Very popular, but quite complex to setup correctly. You can cheat by copying the file here. [DONE]
* `buildpacks`. Less popular, but tends to 'auto guess' what to build and what to run. Often it just works! [wip]


## Buildpacks (🚧 #workinprogress)

With Buildpacks the app gets built automagically. Unfortunately you don't have full control so you might end up with unexpected configuration.

* Check out   BuildPacks on GCP: https://cloud.google.com/docs/buildpacks/build-application and [here](https://cloud.google.com/docs/buildpacks/build-application#build_an_application_remotely)
* Install `pack`: https://buildpacks.io/docs/for-platform-operators/how-to/integrate-ci/pack/
* buildpacks in PHP: https://cloud.google.com/docs/buildpacks/php (where it tells you how to set up the PHP version)
* Try something like `pack build --builder=gcr.io/buildpacks/builder my-app-with-buildpacks`

## Docker (more control)

*But I want to have control! I want Docker!*

Sure! This makes sense when you need to configure specific libraries, and inject certain non-obvious behaviours (a chmod in `uploads`, a non-standard executable in your app, ..)

* Docker for PHP on GCP: https://cloud.google.com/run/docs/quickstarts/build-and-deploy/deploy-php-service

Ok, how do you get the `Dockerfile`?

* I've asked Gemini this question. Result: under `dockerize-gemini/` folder.
    * I just needed to change `COPY .` into `COPY app/` and it worked at first time! Yup, it's THAT simple!
    * You will notice a further bug in the future which can be solved by adding a library..
* You can just copy the working one under `.solutions` but I encourage you to do some tests. To test a docker file you need to:
     * install `docker` locally (your cloud shell has it!)
     * edit a file called `Dockerfile`.
     * have the app somewhere, eg under `app/`
     * Type: `docker build -t my-php-app-docker app/`.

### Docker run

Once you built it, you want to test if it runs.

Something like:

```bash
docker run -it -p 80:8080 my-php-app-docker
```

Then point your browser to that endpoint.
* If localhost: open http://localhost:8080/
* If cloud Shell, click on the button to expose local `8080` via proxy (button "Preview" -> "preview on port 8080").

## Does it run?

Since we haven't configured the DB Yet, a *working* app shows this error:

```
Errore di connessione: could not find driver
```

If you got here, it's a **SUCCESS**!

On to the next chapter.


## URLography

* https://cloud.google.com/run/docs/quickstarts/build-and-deploy/deploy-php-service

## Caveats

* Error: **PDOException “could not find driver”**: if your dockerfile doesn't contain `pdo_mysql` this might happen. See [this article](https://stackoverflow.com/questions/2852748/pdoexception-could-not-find-driver).
