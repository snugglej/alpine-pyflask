# flask ldap image
FROM alpine:latest
LABEL Description="Python3, flask and ldap continer for running a web server with ldap authentication"
LABEL Version="0.1"
EXPOSE 5000
RUN apk add python3 build-base openldap-dev python3-dev \
&& pip3 install --upgrade pip \ 
&& pip3 install virtualenv python-ldap\
&& apk del build-base openldap-dev python3-dev \
&& if [ ! -d /python-project ]; then mkdir /python-project; fi
WORKDIR /python-project
CMD "virtualenv /python-project && pip install flask && if [ -f /python-project/routes.py ]; then python3 /python-project/routes.py; fi"