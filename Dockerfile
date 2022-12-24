FROM ubuntu:22.04

RUN apt-get update \
  && apt-get install -y shellcheck \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app

WORKDIR /app

CMD ["bash", "./shellcheck.sh"]
