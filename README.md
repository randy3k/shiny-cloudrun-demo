# Running Shiny app on Google Cloud Run

```
PROJECTID=$(gcloud config get-value project)
```

```
docker build . -t gcr.io/$PROJECTID/shinyrun
```

Test locally
```
docker run --rm -it -p 8080:8080 gcr.io/$PROJECTID/shinyrun:latest
```

Push image to Google Registry
```
gcloud auth configure-docker
docker push gcr.io/$PROJECTID/shinyrun
```

Alternatively, ultilize Googld Builds to build image
```
gcloud builds submit --tag gcr.io/$PROJECTID/shinyrun
```

Deploy to Google Cloud Run
```
gcloud run deploy --image gcr.io/$PROJECTID/shinyrun --platform managed
```
