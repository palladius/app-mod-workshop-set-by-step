
# BELLA

Riccardo, steps per ora

## Steps

* `00-fork-code/`. After doing step 0, you mioght want o jump to step 4 as spinning a SQL instance might take 10m or so.
* `01-dockerize/`
* `02-gcloud-deploy-to-cloud-run/`
* `03-no-cleartext-password/`
* `04-database-is-missing/`

# BRUTTA

## Steps forse fatti meglio

* inizia Cloud SQL immediatamente
* git clone app appena puoi, cosi' cominci a metterci un .env e roba varia.
* la cosa da clonare DOVREBBE essere super semplice, tipo avere .env.dist e cloudbuild e cosi via gia imbastiti.

## Con cosa cominciamo?

Le cose con cui comnciare dovrebbero essere:

1. Fork + `git pull` repo cosi' la gente ha spazio per mettere le cose iterativamente sul loro `.env`.
2. Crea un DB MySQL (che poi ci mette del tempo)
