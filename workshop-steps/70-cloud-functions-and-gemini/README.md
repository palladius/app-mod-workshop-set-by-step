## Prerequisites

In the previous chapter, a model solution allowed us to mount images `/uploads/` on GCS, *de facto* separating the App logic from the image storage.

This exercise requires you to:

* Have succesfully completed excericse in chapter 6 (storage).
* Have a GCS bucket with the image uploads, where people upload pictures on your app and pictures flow to your bucket.

## Set up a Cloud function (in python)





## Patch the db

1. Open Cloud SQL Studio:

![Cloud SQL Studio UI](image.png)

2. Put your user and password for the Images DB
3. Inject this SQL which adds a column for an image descripton:

```sql
-- Images table - Adding a description textual field for Gemini to populate it
ALTER TABLE images
ADD COLUMN description TEXT;
```

![Running SQL comfortably in the UI](image-1.png)

And bingo! Try now to check if it worked:

```sql
SELECT * FROM images;
```

You should see the new description column:

![Showing it works!](image-2.png)

## Write the Gemini GCF

I've actually asked Gemini to write it for me, then I changed a few things.

A possible code:

```python
TODO(ricc): wuando va
```

## Dritte per Maurizio.


Allora Maurizio qualche dritta:

Tutto il codice e' nel mio repo app personale. In pratica devi fare 3 cose

1. update SQL x colonna descrizione - gia emsso di sopra
2. GCs setup - nello step 60.
3. GCF setup

## GCF Setup - da migliorare

1. La funzione e' tutta dentro `main.py`. PEr testarla - ci e' voluto un po - ho creato test.py ma a te non serve, copincolla solo la main e il `requirements.txt` ovviamente e ARA tutto il resto. https://github.com/Friends-of-Ricc/app-mod-workshop/blob/main/gcf/main.py

2. La funzione di push e' una chicca, richiede un vallo di ENV var (le 4 sorelle perche quel cavolo di pymysql non support il singolo URLone come fa SQLAlchemy. Questo per dire  che sei in tempo ancora a splendere e fare porting su SQLAlchemy cosi ce la caviamno con una ENV sola.) https://github.com/Friends-of-Ricc/app-mod-workshop/blob/main/gcf/push-to-gcf.sh

Secondo me con questi due file vai come un filo d'olio.

