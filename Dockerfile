FROM node:slim

LABEL maintainer="Yevhen Laichenkov - elaichenkov@gmail.com" \
      project-name="Protractor with headless Chrome"  \
      project-description="Protractor with headless Chrome on Docker and nothing more" \
      release-date="29/04/2018"

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y \
    google-chrome-stable \
    curl \
    nano \
    wget gnupg && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g \
    npm \
    protractor \
    webdriver-manager && \
    webdriver-manager update && \
    mkdir /protractor && \
    chmod -R 777 /protractor

COPY adduser.sh/

WORKDIR /protractor

ENTRYPOINT adduser.sh && /bin/bash  









