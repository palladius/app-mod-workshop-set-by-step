
You've completed EVERYTHING, what's missing?

Some food for thought:

## Uploads to GCS

This is a complex migration: you want

* Use PHP to send uploads to a GCS bucket.
* set up a secure Service Account that does that.
* enabled public bucket (for simplicity, or you can set up a more complex signed URL).
* pull/visualize images from the bucket.

To achieve this, you need to install PHP GCP libraries to access GCS.

## Security

To secure the app, this is a different chapter entirely, check out the `SECURITY.md`
