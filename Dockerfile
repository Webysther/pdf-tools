FROM python:2
LABEL maintainer "nshadov <ns@ravencloud.net>"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install curl wget

RUN pip install pip --upgrade
RUN pip install -U oletools pdfparse pypdfparse
RUN pip install yara

RUN useradd -mrs /bin/bash malware
WORKDIR /home/malware

USER malware

ENTRYPOINT /bin/bash
