FROM ubuntu:24.04

LABEL name="flowerpowerlinux"
LABEL version="1.4"
LABEL maintainer="Vicent Benavent"
LABEL description="Versió educativa de Linux Extrem"

FROM ubuntu:22.04

# Copiar scripts propios
COPY flowerpowerlinux.sh /usr/local/bin/flowerpowerlinux

RUN chmod +x /usr/local/bin/flowerpowerlinux
RUN apt update && apt install sl tree zip gzip nano -y
RUN mkdir LOGS

ENV PATH="${PATH}:/usr/games"

CMD ["/usr/local/bin/flowerpowerlinux"]