FROM node:slim

LABEL vendor="Yevhen Laichenkov" \
      com.coreAutomation.release-date="29/04/2018"

RUN apt-get update && \
    apt-get install -y \
    curl \
    nano \
    wget gnupg


RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*


RUN node -v

RUN npm -v

RUN npm install -g \
    npm \
    protractor \
    webdriver-manager

RUN webdriver-manager update

WORKDIR /protractor







