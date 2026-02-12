FROM            python:3.13.5
RUN             useradd -u 1001 roboshop && mkdir /app && chown roboshop:roboshop /app
WORKDIR         /app
COPY            payment.ini payment.py rabbitmq.py requirements.txt /app/
RUN             pip3 install -r requirements.txt
ENTRYPOINT      [ "uwsgi", "--ini", "payment.ini" ]