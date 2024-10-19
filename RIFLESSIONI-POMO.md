This is a public "post-mortem" to capture what worked and what didnt in 12oct24 @ Modena DevFest  `PHP Amarcord` very first workshop.
## Modena Workshop PostMortem

On Saturday 12 Oct 2024, Riccardo Carlesso drove a "PHP Amarcord" workshop in DevFest Modena, which seemed to be a success.

## Timeline
```bash
# All times are in CE(S)T 🇮🇹. Date 2024-10-12
11:10 Started the workshop. Had around 10-15 people. Mirko Gilioli helped me run it. **BEGIN of workshop**
11:25 Finished presenting the slides - everyone had access
13:05 one student is able
13:10 Declared the end of the workshop. 90% of people got the app running locally or on Cloud Run. One person got CICD (Cloud Build) kind of working. Workshop ended with ~30 people more as people kept arriving at 11:40, 12:00, mnd so on. **END of workshop**
```
## About the workshoppers.

* People had a 50/50 of Windows setup (they were then suggested to go use Cloud Shell).
* Some of the people already have the GCP free trial credits, but they were expired
* Some others were news to GCP and they had no previous experience.
* One person filed a PR to contribute Dockerfile for PHP 5 build!

### Progress on workshop

* **~15** people were in the workshop for the whole **2 hours**. Another 10-15 were in the workshop for 45-90min
    * => ~**25** for a subset of the available time.
* **19** forks from https://github.com/gdgpescara/app-mod-workshop (likely **16** workshop + 3 Ricc+organizers)
* **28** onramp credits redeemed.

In that time,

* Everyone was able to set up Cloud SQL and connect to it.
* 15-20 people were able to dockerize it.
* 5-10 people were able to deploy to Cloud Run (some with correct MySQL connection)
* ?? people were able to set up Secret Manager
* 1 person was able to set up CI/CD on Cloud Build (broken)
* 2 people promised in blood they'd finish the workshop at home

### Dev issues / frictions

* [onramp] many people (I'd say 40% of them) were struggling in getting their credits redeemed. The main cause was that
they already had a GCP free trial account on the email they used and this was causing them not to be able to use the
correct billing account. We work around by tell them to create a brand new gmail account and use it for reedemption.
* [onramp] only 1 person had a problem with onramp, particularly to create a project after redemption (b/0002). After investigation, we realized they used a student email and not a gmail. It looks like - if you have an existing organization, it's impossible from UI to create a new project. It gives error as in "you need to choose unimo.it org". Not sure if this some sort of org policy applied to a certain domain emails or it is a UI bug.
* [github_fork] One person did their first fork ever, so we had to set up their SSH key. This was a bit lengthy -> good to add to prework.

## PoMo :apple: 3 questions

### What worked :grin:

* [ricc] onramp worked beautifully. [Mirko -> I think the process can be improved in particular with the credit redemption]
* [ricc] After 15 slides, people were able to actually do the work. I said "do your stuff and call me when blocked" and people were rarely blocked. Two people were able to easily cover 20 people.
* [ricc] People loved having a **Gemini API Key** to use outside the workshop. People were thrilled to be able to use it independently from this workshop in the next 3 months.
* [ricc] Having a double setup documented (Cloud Shell vs power mode (`vscode`, download `gcloud`, `mysql`, `docker`, ..) worked well. People chose naturally the best for them. They oved cloud shell, but the UX was indeed clumsier to open/edit files.

### What didn't work  :weary:

* [maurizio] Lack of workshop introduction. There were no clear explanations of the goal and the context. We need to improve the
section 00 to provide more. We had to address this verbally to each one.
* [ricc] A student used the `UniMo.it` account and could NOT reclaim BAID with that email. Luckily he could unblock by getting a second account on onramp with his gmail.
* [ricc] People were confused on two repos - one with the PHP code, one with the `.env`. "Where is the .env?" came up 3 times. Make it clear, maybe add a slide.
* [maurizio] We need to migrate the workshop to a better platform (codelabs is currently under investigation by MM/Ricc). See AIs below.
* [maurizio] Develop a detailed migration plan with timeline, resource requirements, and specific platform recommendations.
* [ricc] Very noisy room, I had to shout at people 5m from me and asked people 15m from me to come closer. This was a one-off issue (multi speaker space) - never happened before.
* [maurizio] Some people were facing issues while pulling the app repo using ssh. We overcome with git clone <https://github.com/REPO- NAME>


### Where we were lucky ☘️

* Few people were blocked at computer setup.
* Many power users.
* People contributed back (your Dockerfile supports PHP7.4 but you said 5.7? Let me build it for you and send you via email).

## Action items

* `b/0001` [P2] Verify if you can do something different than Cloud SQL. We calculate Cloud SQL will last ~24h.
     * Either teach them to configure Cloud Scheduler to turn off cloud sql `gcloud instances stop blah blah`
     * or use Firebase
     * or just tell them nicely (as I did) in some cleanup folder.
* `b/0002` [P1] Big error Unimo student could NOT create a project in no-org since they had one org (!! I swear I tried 5 times)
* `b/0003` [P3] Get feedback from Mirko and integrate here.
* `b/0004` [p2] Riccardo create a pre-work document to hand over to Gregorio to give to workshop participants, so they come with the repo already forked, and maybe onramp already created.
* `b/0005` [p1] Riccardo: move this repo to proper Google `Codelab`.
     * **Positives**:
          - Improved structure for the workshop git repository
          - Simplified setup: include only the app folder with the code
          - Streamlined experience: attendees can work directly without jumping back and forth
     * **Negatives**: a git repo allows for PRs and I just merged two (one on README/PoMo and one on PHP 5.7 Dockerfile - wow! I';m humbled from such a great community!)

| Priority | Bug ID | Owner | Description |
|---|---|---|---|
| P2 | b/0001 | Riccardo | Verify if there's an alternative to Cloud SQL for a ~24h duration. Consider Cloud Scheduler, Firebase, or providing guidance in a cleanup folder. |
| P1 | b/0002 | Riccardo | Unimo student couldn't create a project in no-org due to existing org. |
| P3 | b/0003 | Riccardo | Get feedback from Mirko and integrate it. |
| P2 | b/0004 | Riccardo | Create a pre-work document for workshop participants, including repo forking and onramp creation. |
| P1 | b/0005 | Riccardo | Move the workshop repository to a proper Google Codelab for improved structure, simplified setup, and streamlined experience.

     * **Positives**:
          - Improved structure for the workshop git repository
          - Simplified setup: include only the app folder with the code
          - Streamlined experience: attendees can work directly without jumping back and forth
     * **Negatives**: a git repo allows for PRs and I just merged two (one on README/PoMo and one on PHP 5.7 Dockerfile - wow! I';m humbled from such a great community!) |
