## Dubbio amletico di Riccardo [REMOVEME]

-----------------

**Ragazzi sta parte non so se metterla DOPO aver creato il DB, o dopo aver fatto la dockerizzazione**.
Se uno esperimenta il locale con PHP, la fa prima, ma se uno non ha un local LAMP stack allora meglio farlo dopo la
dockerizzazione. Io nel mentre la metto qui

-----------------

## Update your password (the dirty way)

We want the app to work ASAP, so we will first make it work the *wrong* way. This is a good way to learn, step by step.

**However**, remember:

1. If you put your new password in cleartext in your PHP code, you shouldn't commit/push the code ([I just did it](https://github.com/Friends-of-Ricc/app-mod-workshop/commit/854b6dcdfa49bb40e7830521352c34226970bc72#diff-724326d4c9977d3f53ba0f053c7d857dc8b8ef4f2d61b2b377791b4ec560720d) 😝 and had to rotate the password - not fun).
2. We will cleanup later on using ENV and Secret Mamnager.

## Three levels of security

| Technology   |  Security     |  Notes |
|----------|:-------------:|------:|
| Passwords in the code |    **<span style="color:red">non existant</span>** | Fix it ASAP. Do not ship to production, do not check your code, do not tell your friends. |
| ENV |   <span style="color:orange">minimum</span>    |  ENV is good for low-secretive stuff like a DB_NAME. It's exchanged between systems so it can surface somewhere. Try NOT to use for everything but secrets/keys. |
| [Secret Manager](https://cloud.google.com/security/products/secret-manager?hl=it) | <span style="color:green">high</span> | [Best in-class Security](https://cloud.google.com/security/products/secret-manager?hl=it) from Google Cloud. INtegrates beautifully with *Cloud Run*. |

We are going to do this in 3 steps:

1. First all in cleartext.
2. Then move everything to ENV.
3. Then move the most secretive parameters (DB Passwords, Gemini API KEYs, ..) onto Secret Manager.

Note we don't want to miss step 2 since it's very useful for everything else: you dont need to save APP_NAME into Secret Manager.


## Step 1 to 2: remove passwords from PHP code

Take `config.php` and change this code:

```
// Configurazione del database
$db_host = 'localhost';
$db_name = 'image_catalog';
$db_user = 'root';
$db_pass = 'veryverystrongpassword';
```

With this code:

```
// Configurazione del database con ENV variables.

// Looks for ENV['BLAH'] and if it fails will take the default string set after.
$db_host = getenv('DB_HOST')  ?: 'localhost';
$db_name = getenv('DB_NAME')  ?: 'image_catalog_default';
$db_user = getenv('DB_USER')  ?: 'appmod-phpapp-user';
$db_pass = getenv('DB_PASS')  ?: '_PWD_SCONOSCIUTA_';
```

This syntax will look for ENV and will use the part after `?:` as default. This is good in case you fail to load ENV, so the page output will tell you if it's using the default values.

Note: This syntax is PHP 5.3-compatible (there are more elegant ones which require PHP 8).

## Test the code!

Now, depending on how you have set up your app locally, you can run your app locally (with docker, or buildpacks).

**Note** that once you've built the app for ENV you can change ENV at execution time without rebuilding it all the time. (if the password is instead set in the code, changing password requires rebuilding the code).


## Step 2 to 3

We will do this later in `workshop-steps/04-no-cleanup-passwords/`.

Let's move to the next step now.

TODO(ricc): Maurizio e Mirko: verificate che quel che ho scritto abbia senso. Grz.
