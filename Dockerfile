FROM ubuntu:bionic
RUN apt-get update -y
RUN apt-get install -y curl wget gnupg2
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

RUN apt-get update -y
RUN apt-get install -y nodejs firefox google-chrome-stable

RUN npm install -g chromedriver geckodriver  webdriver-manager --unsafe-perm=true --allow-root
RUN webdriver-manager update

# Dockerfile
# add this and below command will run without cache
# install new version of Tastee
ARG CACHEBUST=1
RUN npm install -g tastee --unsafe-perm=true --allow-root

ENTRYPOINT ["tastee"]
