FROM python:2
LABEL maintainer "nshadov <ns@ravencloud.net>"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y sudo curl wget
RUN apt-get install -y yara
RUN apt-get install -y nano vim zsh curl git sudo
RUN apt-get install -y ghostscript

RUN apt-get autoremove --purge -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install pip --upgrade
RUN pip install oletools pdfparse pypdfparse peepdf hachoir3 hachoir-core hachoir-metadata hachoir-urwid hachoir-subfile

RUN git clone --recursive https://github.com/nshadov/yara-rules /opt/yara-rules

ADD tools /opt/tools

RUN useradd -m malware && \
  adduser malware sudo && \
  echo "malware:malware" | chpasswd
RUN chsh -s /bin/zsh malware

WORKDIR /home/malware


USER malware
ENV HOME /home/malware

CMD [ "/bin/bash" ]
