FROM ubuntu:xenial
RUN apt-get update -y
RUN apt-get install -y curl wget
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN apt-get update -y
RUN apt-get install -y \ 
    nodejs \
    x11vnc \
    xvfb \
    xfonts-100dpi \
    xfonts-75dpi \
    xfonts-scalable \
    xfonts-cyrillic \
    unzip \
    firefox \
    google-chrome-stable

RUN npm install -g chromedriver \
    geckodriver \
    webdriver-manager \
    tastee \
    --unsafe-perm=true --allow-root

RUN wget -N http://chromedriver.storage.googleapis.com/$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE)/chromedriver_linux64.zip -P ~/
RUN unzip ~/chromedriver_linux64.zip -d ~/
RUN rm ~/chromedriver_linux64.zip
RUN mv -f ~/chromedriver /usr/local/bin/chromedriver
RUN chown root:root /usr/local/bin/chromedriver
RUN chmod 0755 /usr/local/bin/chromedriver

RUN webdriver-manager update

ADD start.sh /tmp/start.sh
RUN chmod -R 777 /tmp
ENTRYPOINT ["/tmp/start.sh"]
