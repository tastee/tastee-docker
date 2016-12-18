# Tastee Docker image

This is a docker with Tastee, selenium and firefox driver.

<img src="https://tastee.github.io/img/home.png"/>

# Usage

Get and build container...

```
git clone https://github.com/tastee/tastee-docker.git
docker build -t "tastee" .
```

and run :

```
docker run -it -v <LOCAL_PATH>:/tmp/tastee tastee -i /tmp/tastee/common-instructions.conf.tee -b firefox --path /tmp/tastee/tastee-reporting /tmp/tastee/starting-tastee.tee
```

LOCAL_PATH is a directory containing the following files:
- common-instructions.conf.tee
- starting-tastee.tee