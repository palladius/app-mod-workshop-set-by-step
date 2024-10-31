This chapter wants to sparkle ideas for further improvements.

# Security

Security is a long journey. If it takes you 4 hours to move your old app to a decent-enough
low-security-bar app to the Cloud, it will probably take you 40-80h to fully secure it.

TODO(Ricc/Mirko): extend this

## IAP

Want to prevent unauthorized access from unintended people?

[Set up IAP](https://cloud.google.com/security/products/iap?hl=en) to control who accesses your app (maybe only people from XXX@my-php-app.com).

## Custom Sservice Account + IAM

To keep things easy, we used a single and powerful Service Account (the `compute` default one). However, you don't want to have a single account able to do everything. To decrease the blast radius, better to have different accounts.

* create ad-hoc Service Account (eg `app-runnner@...`, `gcs-writer@...`, `app-builder@..` ).
* Set up strict, minimal IAM access for each SA.

## DB hardening

Do what's needed to disable Cloud SQL public IP (you'll sleep tighter sleeps after).

Possible solutions:

* set up proxy
* use the connector

Note: some info is already in the 01 README.

