FROM nasoym/bash_socat_server
MAINTAINER Sinan Goo

RUN echo 'http://dl-4.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && apk update 
RUN apk --no-cache add jq curl
RUN apk --no-cache add docker
RUN apk --no-cache add parallel

ADD handlers /handlers

ENTRYPOINT ["./run.sh"]
CMD ["-r /handlers", "-d /handlers/default", "-c"]

