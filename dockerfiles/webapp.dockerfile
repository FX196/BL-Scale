FROM ubuntu:18.04

USER root

RUN apt update
RUN apt install -y git curl python3-pip gunicorn3

RUN mkdir /code
WORKDIR /code
RUN git clone https://github.com/FX196/BL-Scale.git
WORKDIR /code/BL-Scale/webapp
RUN pip3 install -r requirements.txt

CMD gunicorn3 -b :5000 main:app
