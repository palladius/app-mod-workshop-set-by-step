This chapter wants to sparkle ideas for further improvements.

# Security

Security is a long journey. If it takes you 4 hours to move your old app to a decent-enough
low-security-bar app to the Cloud, it will probably take you 40-80 to fully secure it.

TODO(Ricc/Mirko): extend this

## IAP

Want to prevent unauthorized access from unintended people?

[Set up IAP](https://cloud.google.com/security/products/iap?hl=en) to control who accesses your app (maybe only people from XXX@my-php-app.com).

## Custom SvcAcct + IAM

* create ad-hoc Service Account (eg `app-runnner@...`, `gcs-writer@...`, `app-builder@..` ).
* Set up strict, minimal IAM access for each SA.

## DB hardening

Do what's needed to disable Cloud SQL public IP (you'll sleep tighter sleeps after).

Possible solutions:

* set up proxy
* use the connector

Note: some info is already in the 01 README.

