#!/usr/bin/env python

'''Documentation:

* Vertex:
* AI Studio: https://ai.google.dev/gemini-api/docs/vision

'''
GCF_VERSION = '0.7'


from google.cloud import storage
from google.cloud import aiplatform

import vertexai
from vertexai.generative_models import GenerativeModel, Part
import os
import pymysql
import pymysql.cursors



# Replace with your project ID
PROJECT_ID = "your-project-id"
GEMINI_MODEL = "gemini-1.5-pro"
DEFAULT_PROMPT = "Generate a caption for this image: "

def gemini_describe_image_from_gcs(gcs_url, image_prompt=DEFAULT_PROMPT):

    aiplatform.init(project=PROJECT_ID, location="us-central1")

    # Generate a caption using Gemini
    model = GenerativeModel(GEMINI_MODEL)

    print(f"Calling {GEMINI_MODEL} for {gcs_url} with this prompt: '''{image_prompt}'''")

    response = model.generate_content([
            Part.from_uri(
                gcs_url,
                mime_type="image/jpeg", # TODO remove or test with PNG..
            ),
            image_prompt,
        ])

    print(f"Gemini spoken: '''{response.text}''' in class today!" )

    # Extract the caption from the response
    return response.text

def update_db_with_description(
        image_filename,
        caption,
        db_user,
        db_pass,
        db_host,
        db_name
        ):
    '''
    '''
    # Transforms the image from gs://bucket/my/image.png into /uploads/image.png.
    # Thats because thats how the app does it. Dont ask me why we embed /uploads/ in the app :)

    image_db_filename = f"uploads/{image_filename}"

    conn = None

    try:
        print(f"update_db_with_description(): Connecting to '{db_name}' DB @{db_host}...")
        # Connect to the database
        #import ipdb; ipdb.set_trace()

        conn = pymysql.connect(
            host=db_host,
            user=db_user,
            password=db_pass,
            database=db_name,)
        cursor = conn.cursor()

        # SQL query to update the database (replace placeholders with actual table and column names)
        sql = 'UPDATE images SET description = %s WHERE filename = %s'
        val = (caption, image_db_filename)

        # Execute the query
        cursor.execute(sql, val)
        conn.commit()

        print(f"[GCFv{GCF_VERSION}] Database updated successfully")

    except Exception as e:
        print(f"[GCFv{GCF_VERSION}] Error updating database: {e}")

    finally:
        # Close the connection
        if conn:
            cursor.close()
            conn.close()


def generate_caption(event, context):
    """
    Cloud Function triggered by a GCS event.
    Args:
        event (dict): The dictionary with data specific to this type of event.
        context (google.cloud.functions.Context): The context parameter contains
                event metadata such as event ID
                and timestamp.
    """

    # Get the file information from the event
    file_name = event['name']
    bucket_name = event['bucket']

    print(f"[GCFv{GCF_VERSION}] Bucket: {bucket_name}")
    print(f"Object path: {file_name}")
    print(f"Multifaceted event: {event}")

    # Download the image from GCS
    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(file_name)
    print(f"Blob: {blob}")
    public_url = blob.public_url
    print(f"Blob public URL: {public_url}")
    gcs_full_url = f"gs://{bucket_name}/{file_name}"
    print(f"[GCFv{GCF_VERSION}] GCS full URL: {gcs_full_url}")

    caption = gemini_describe_image_from_gcs(gcs_full_url)

    # Print the caption (you can also store it or use it as needed)
    print(f"[GCFv{GCF_VERSION}] Generated caption: {caption}")

    # Gets DB info from ENV
    db_user = os.getenv('DB_USER', None)
    db_pass = os.getenv('DB_PASS', None)
    db_host = os.getenv('DB_HOST', None)
    db_name = os.getenv('DB_NAME', None)
    if db_user is None:
        print("DB_USER is not set. I cant proceed. Please get your ENV back together!")
        return -1
    if db_pass is None:
        print("DB_PASS is not set. I cant proceed. Please get your ENV back together!")
        return -1
    if db_host is None:
        print("DB_HOST is not set. I cant proceed. Please get your ENV back together!")
        return -1
    if db_name is None:
        print("DB_NAME is not set. I cant proceed. Please get your ENV back together!")
        return -1
    update_db_with_description(
        image_filename=file_name,
        caption=caption,
        db_user=db_user,
        db_pass=db_pass,
        db_host=db_host,
        db_name=db_name)
    return True

def flag_as_inappropriate():
    '''You do this!'''
    pass
