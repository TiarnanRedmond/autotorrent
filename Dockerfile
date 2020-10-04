FROM python:3-alpine

WORKDIR /config

RUN pip install --no-cache-dir autotorrent

# backwards compatibility (from https://success.docker.com/article/use-a-script-to-initialize-stateful-container-data)
COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN ln -s /usr/local/bin/docker-entrypoint.sh 

VOLUME [ "/config", "/torrents", "/downloads", "/virtual-seed" ]

ENTRYPOINT [ "docker-entrypoint.sh" ]
