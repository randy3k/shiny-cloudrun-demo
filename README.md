# Running Shiny app on Google Cloud Run


EDIT: it is probably outdated as Google Cloudrun now supports websocket.


```
PROJECTID=$(gcloud config get-value project)
```

Build the image locally and push to Google registry
```
docker build . -t gcr.io/$PROJECTID/shinyrun
# optional, test locally
# docker run --rm -p 8080:8080 gcr.io/$PROJECTID/shinyrun:latest
gcloud auth configure-docker
docker push gcr.io/$PROJECTID/shinyrun
```

Alternatively, ultilize Googld Builds to build image
```
gcloud builds submit --tag gcr.io/$PROJECTID/shinyrun
```

Deploy to Google Cloud Run
```
gcloud run deploy --image gcr.io/$PROJECTID/shinyrun --platform managed --max-instances 1
# for project with large memory need
# gcloud run deploy --image gcr.io/$PROJECTID/shinyrun --platform managed --max-instances 1 --memory 1G
```
