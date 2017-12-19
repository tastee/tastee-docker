FROM ubuntu:xenial
RUN apt-get update -y
RUN apt-get install -y curl wget
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN apt-get update -y
RUN apt-get install -y \ 
    nodejs \
    unzip \
    firefox \
    google-chrome-unstable

RUN npm install -g chromedriver \
    geckodriver \
    webdriver-manager \
    tastee \
    --unsafe-perm=true --allow-root

RUN webdriver-manager update

ENTRYPOINT ["tastee"]
