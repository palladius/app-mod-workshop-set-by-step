
## Storage

Currently the app stored the state in a docker container.
If the machine breaks, the app explodes, a new will be scheduled, with a reset (=empty) storage.

How do we fix it? there are a number of approaches.

1. Store images in the DB. That's what i've ended up doing with my previous PHP app. It's the simplest solution as it doesn't add complexity to it. But it adds latency and load to your DB for sure!
1. Migrate your Cloud Run app to a storage-friendly solution: [GCE + Persistent disk](https://cloud.google.com/persistent-disk?hl=en)? Maybe [GKE + Storage](https://cloud.google.com/kubernetes-engine/docs/concepts/storage-overview)?
1. Move to [GCS](https://cloud.google.com/storage?hl=it). Google Cloud Storage offers best in class Storage for the whole of Google Cloud and it's the most Cloud idiomatic solution. However, it requires us with getting dirty with PHP libraries. Do we have [PHP 5.7 libraries for GCS](https://cloud.google.com/php/docs/reference/cloud-storage/latest)? Does `PHP 5.7` even support Composer?

## Migrate storage (open ended)

In this exercise, we want you to find a solution to move your images in a way which is persisted in some way.

### Acceptance test

I don't want to tell you the solution, but I want this to happen:

1. You upload `newpic.jpg`. You see it in the app.
2. You upgrade the app to a new version.
3. `newpic.jpg` is still there, visible.
