
## Respect the Environment

It all starts with `ENV`. ENV is the "**bridge**" between your deployed app and your system to provide those variables.

Example:

From:

```
$db_host = 'localhost'; // or https://1.2.3.4/
$db_name = 'my_awesome_db';
$db_user = 'my_secret_user';
$db_user = 'nonL4Indovin3r4iM41';
```

to:


```
$db_host = getenv('DB_HOST');
$db_name = getenv('DB_NAME');
$db_user = getenv('DB_USER');
$db_user = getenv('DB_PASS');
```


## Let's get to work!


**1. Create the `.env` file**

Get inspired by local .env.dist and copy it locally.
I made it so you can't easily add to git mistakenly.

To work with GCP, you need (at least) to put a Project id and a Region where you want to deploy stuff.




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
