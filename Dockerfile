FROM python:3.7-slim
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./
RUN pip install Flask gunicorn Pillow tensorflow tensorflow_hub keras numpy
RUN pip install pipenv
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app
gcloud run deploy --image gcr.io/style-transfer-3/style-transfer --platform managed