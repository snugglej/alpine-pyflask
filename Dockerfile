# flask ldap image
FROM alpine:latest
LABEL Description="Python3, flask and ldap continer for running a web server with ldap authentication"
LABEL Version="0.1"
EXPOSE 5000
RUN apk add python3 build-base openldap-dev python3-dev \
&& pip3 install --upgrade pip \ 
&& pip3 install flask python-ldap \
&& apk del build-base openldap-dev python3-dev \
&& mkdir /python-project \
WORKDIR /python-projcet
CMD "python /python-project/routes.py"