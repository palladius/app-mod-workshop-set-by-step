
Self: https://github.com/palladius/app-mod-workshop-set-by-step

This contains solutions (spoiler alert!) for the AppMod workshop invented by Riccardo and inspired by a failed
talk on AppMod: "scrap your old app to the Cloud" (*rottama la tua vecchia app verso il Cloud*).

This workshop will be run by Googlers who will provide some entrypoint to GCP (eg, *coupons*).

## folder

* `app/` Contains a `curated` copy of the [🧑🏻‍💻 gdgpescara/app-mod-workshop](https://github.com/gdgpescara/app-mod-workshop) app (since i have no control of the original code).
    * Current commit: `35e71a981a53299319da1ff209be2b4e7b3e20c6` from Tue Oct 1 2024

## Prerequisites

* A computer with a browser.
* Some GCP credits. Ask your local Google aficionado for some ;)
* `gcloud` working.
    * Are you working **local**? download it [here](https://cloud.google.com/sdk/docs/install). You will also need some nice editor (eg `vscode` or ).
    * Want to do everything "**in the Cloud**"? You can use [cloud Shell](https://cloud.google.com/shell/docs) then.
* a **Github user**. You need this to branch the original code [🧑🏻‍💻 gdgpescara/app-mod-workshop](https://github.com/gdgpescara/app-mod-workshop) with your own git repo. This is needed to have your own CI/CD pipeline (one commit -> one build ~> one deploy)
    * For instance: https://github.com/Friends-of-Ricc/app-mod-workshop

**Nice to haves**:

* Install [Cloud Code](https://cloud.google.com/code?hl=it) on your local `vscode` or `JetBrains` IDEs.
* rename the repo with a better English name: NOT set-by-step but step-by-step.

## License

MIT just like original app.

## thanks

* [Gregorio palamà](https://www.linkedin.com/in/gregorio-palam%C3%A0/) for inspiration and PHP code.
* [Maurizio Ipsale](https://www.linkedin.com/in/maurizioipsale/) and
  [Mirko Gilioli](https://www.linkedin.com/in/mirko-gilioli/) for having my workshop in GDG Modena.
