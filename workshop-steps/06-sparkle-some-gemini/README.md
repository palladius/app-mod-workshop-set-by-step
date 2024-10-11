## Open ended ideas

Now you have an awesome modernized, shiny new PHP app (like a 2024 `Fiat 126`).

You have a Gemini API Key you can get from [here](https://ai.google.dev/gemini-api/docs/api-key).

What can you do with it?

## 1. Start simple

* Delve into Gemini for PHP documentation.
* Learn to install the library in your `Dockerfile`
* create a `gemini.php` page which calls some kind of completion of "Why PHP is still awesome in 2024?".
* test it locally until you get it to work.
* add `GEMINI_API_KEY` to SecretManager
* Deploy a new version to Cluod Run!

## 2. This is too easy!

Really?

Well then, for every image in the DB, use Gemini multimodality to ask "what's in the image"?
This could be done contextually to a person uploading a new image, and maybe Gemini could take a guess in that being SFW or NSFW.
Maybe wrap it in a Google Cloud Function.

# Further ideas (merge conflict)

* A Google Cloud (Run) Function with Gemini call via API_KEY which returns what's in an image provided the link to GCS?
* Add to php a page with generation given `GEMINI_API_KEY` in SecretManager

# Links

* [Gemini and PHP](https://github.com/gemini-api-php/client) - not sure if `composer require gemini-api-php/client` will work with PHP 5.7. Welcome to 1955, Mertin!
