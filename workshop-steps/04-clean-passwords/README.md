Preparing an app for the cloud is all about extracting pieces of info from the app to the outside world,
and this is normally done (as a first step) with `ENV` variables. this allows you to deploy similar versions
of the same app to different endpoints, with slightly different configurations.

Let's see4 this with some examples.

## Respect the Environment (TODO(ricc) integra meglio con il 2.5)

It all starts with `ENV`.

ENV is the "**bridge**" between your deployed app and your system to provide those variables.

Example:

From:

```
$db_host = 'localhost'; // or https://1.2.3.4/
$db_name = 'my_awesome_db';
$db_user = 'my_secret_user';
$db_user = 'nonL4Indovin3r4iM41';
```

to:

```php
# TODO(ricc):  obsoleto - vedi 2.5
$db_host = getenv('DB_HOST');
$db_name = getenv('DB_NAME');
$db_user = getenv('DB_USER');
$db_user = getenv('DB_PASS');
```


## Let's get to work!


**1. Create the `.env` file**  TODO(ricc): sposta allo step `00-fork`

Get inspired by local .env.dist and copy it locally.
I made it so you can't easily add to git mistakenly.


## Even better

What about using Secret Manager?

Maybe the secretest of your secrets (in proper English, "deep secrets") can't stand on ENV, you're afraid someone could
steal it. So let's do better. Let's make sure this NEVER makes it anywhere else than Secret Manager.

```
$db_host = getenv('DB_HOST'); // from ENV
$db_name = getenv('DB_NAME'); // from ENV
$db_user = getenv('DB_USER'); // from ENV
$db_user = getenv('DB_PASS'); // Stored and linked to Secret Manager
```

## Secret Manager

* Click on [Secret Manager](https://console.cloud.google.com/security/secret-manager). First time you will be asked to enable the API:
![alt text](image.png)
* Now click "Create a secret": Let's call it rationally
   * Name: `php-amarcord-db-pass`
   * Secret value: '*your DB password*' (ignore the "upload file" part).
* annotate this secret link, should look like `projects/839850161816/secrets/php-amarcord-db-pass`. This is the univoque pointer to your secret (For Terraform, Cloud Run, and others).
* Now we need to tell Cloud run how to get this information:
* Finally, clean up your code and remove every essence of DB_PASS. Your code is now clean!


## YAML YAML guaglio' (tm)

Let's try to do the same with a more prescriptive multi-stage home-written Cloud Build `YAML` file.

* Copy the previous script, since most stuff will be the same as your first script: Click the 3 dots, then "Duplicate"

![alt text](image-1.png)

* Rename `on-git-commit-build-php-app-1` to `on-git-commit-build-php-app-cbyaml`
* Click EDIT
* Configuration: change from "autodetected" to "Cloud Build configuration file (YAML or JSON)"
* Create or copy from here the `cloudbuild.yaml`
    * TODO ricc quando funge mettilo qui.
    * WIP - for now its here.: `git@github.com:Friends-of-Ricc/app-mod-workshop.git`
* Add variables (note you need to prepend them with a "_"):
     * `_APP_NAME`: something mnemonic about your PHP app
     * `_DB_NAME`: Your ENV `DB_NAME`
     * `_DB_USER`: Your ENV `DB_USER`
     * `_DB_HOST`: Your ENV `DB_HOST`
     * What about `DB_PASS`? Great question! You don't need her. She's in the beautiful and secure realm of Secret Manager! By the end of this exercise, you'll wish you'd moved everything to SM!
![alt text](image-2.png)

## RICC rimuyovimi quando funge

TODO(Ricc): finisci sta parte e trova la riga da metter su cloud run tipo:

* TOGLI --env DB PASS
* METTI --env-ecret sobenme secrets/php-amarcord-db-pass
