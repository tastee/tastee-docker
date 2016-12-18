FROM ubuntu:yakkety
RUN apt-get update
RUN apt-get install -y curl firefox
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update -y

RUN apt-get install -y --allow-unauthenticated -q \
  firefox \
  google-chrome-stable \
  nodejs \
  x11vnc \
  xvfb \
  xfonts-100dpi \
  xfonts-75dpi \
  xfonts-scalable \
  xfonts-cyrillic \
  git
RUN npm install -g geckodriver
RUN npm install -g chromedriver
RUN npm install -g https://github.com/tastee/tastee-npm.git 
ADD start.sh /tmp/start.sh
RUN chmod -R 777 /tmp
ENTRYPOINT ["/tmp/start.sh"]
