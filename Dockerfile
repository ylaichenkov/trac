FROM node:slim

LABEL maintainer="Yevhen Laichenkov - elaichenkov@gmail.com" \
      project-name="Protractor with headless Chrome"  \
      project-description="Protractor with headless Chrome on Docker and nothing more" \
      release-date="29/04/2018"

WORKDIR /tmp

ENV NODE_PATH=/usr/local/lib/node_modules:/protractor/node_modules

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y \
    google-chrome-stable \
    curl \
    nano \
    sudo \
    wget gnupg && \
    apt-get install -f -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g \
    npm \
    protractor \
    webdriver-manager && \
    webdriver-manager update && \
    mkdir /protractor

# ENV GOSU_USER="0:0" \
#     GOSU_CHOWN="/protractor"


# RUN adduser --home /app --uid 1005 \
#   --disabled-login --disabled-password --gecos jenkins jenkins

COPY adduser.sh /

# RUN chmod +x /adduser.sh

WORKDIR /protractor

ENTRYPOINT ["/adduser.sh"]

# RUN arch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" && \
# 	wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.10/gosu-$arch" && \
# 	chmod a+x /usr/local/bin/gosu 


# ENV GOSU_USER="0:0" \
#     GOSU_CHOWN="/home/node"


# COPY gosu-entrypoint.sh /
#RUN chmod +x /gosu-entrypoint.sh && \
#	/showversions.sh
# RUN chmod +x /gosu-entrypoint.sh

# ENTRYPOINT ["/gosu-entrypoint.sh"]










