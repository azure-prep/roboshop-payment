FROM        python:3.13.5
RUN         groupadd -g 1001 roboshop && useradd -u 1001 -g 1001 -m roboshop
RUN         mkdir /app
COPY        . /app
RUN         chown -R roboshop:roboshop /app
USER        roboshop
WORKDIR     /app
RUN         pip3 install -r requirements.txt
ENTRYPOINT      [ "uwsgi", "--ini", "payment.ini" ]
