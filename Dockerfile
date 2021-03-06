FROM python:3.7.5-slim-buster
MAINTAINER David Ellinger <david.ellinger@me.com>

ENV INSTALL_PATH /diceroll
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "diceroll.app:create_app()"
