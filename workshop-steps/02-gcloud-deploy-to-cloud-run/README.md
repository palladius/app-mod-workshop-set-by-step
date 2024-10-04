
## Prerequisites

* Now you have your app and you're able to build it (with BuildPacks or Deockerfile). (if not, Step 1)
* You also have some $$ in a Billing Account on GCP (as part of your GDG Workshop).
* You also have installed `gcloud`, `git` and so on.

Now it's Time to deploy to Google cloud!

Let's try to make it work in two steps

* Step 1: be interactive until it works.
* Step 2: The second time you do it, you should be bored of interactions (unless you love clicking numerous times on Windows machines!).

## 1. gcloud run deploy (simple invocation)

If you invoke `gcloud run deploy` and you're lucky, likely you'll get gcloud to ask you some additional questions:

* **Source code location** (where the code is): very important!
* **Service Name** (name of the app): you can accept the default.
* **Allow unauthenticated invocations to [appname]**: YES.
    * Cloud run is secure by default, but for the demo we want you and your boss to be able to see it with no protection.
    * In a real-life application, you'd probably respond NO and set up some sophisticated measure like IAP.
* **Region**: where do you want to run this? Probably close to where you live (Europe)?

Note this will take a few minutes the first time.

## 2. gcloud run deploy (sophisticated invocation)

Now imagine you want to instruct a computer, or a `Cloud Build` script to do the `gcloud run deploy`. You don't want to
keep repeating the same info over and over... and what if you get the region wrong, or the app name wrong? Oh no!
Now you have 2 similar apps runnign around - which is the latest?

So you want to craft the golden `gcloud run deploy --option1 blah --foo bar --region san-lazzaro-di-savena`. How do you do it?

1. Repeat step 2-3-4 until `gcloud` stops asking questions:
2. [LOOP] `gcloud run deploy` with options found so far
3. [LOOP] systems ask for option X
4. [LOOP] Search in [public docs](https://cloud.google.com/sdk/gcloud/reference/run/deploy) how to set up X from CLI
   adding option "--my-option [my-value]".
    * Back to step 2 now!
5. This `gcloud run deploy BLAH BLAH BLAH` rocks! Save it down somewhere, you'll need it later for Cloud Build step!
   Well done!


## Why cloud Run?

Fair question! Years ago you would have surely chosen Google App Engine.

Simply put, today Cloud run has a newer tech stack, it's easier to deploy, cheaper, and scales to 0.


## Tips

* gcloud Docs: https://cloud.google.com/sdk/gcloud/reference/run/deploy
