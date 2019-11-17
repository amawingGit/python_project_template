FROM python:3.7.5-slim-buster

#RUN yum install build-essential

RUN apt-get update && \
    apt-get install -y -qq openssl ssh gettext sudo build-essential

COPY requirements.txt ./

RUN pip install -r requirements.txt

#Add /src /app

COPY . /app

WORKDIR /app

CMD ["python", "app.py"]