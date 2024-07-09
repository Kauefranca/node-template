FROM node:22.4

ENV TERM=xterm-256color
ENV TZ=Brazil/East
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y \
    build-essential \
    vim \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' user && \
    # adduser user sudo && \
    chmod -R 777 /home/user &&\
    chown -R user:1000 /usr/local/bin &&\
    chown -R user:1000 /usr/local/lib &&\
    chown -R user:1000 /usr/local/etc &&\
    chown -R user:1000 /usr/local/include &&\
    chown -R user:1000 /usr/local/share 

RUN cp --backup=t /etc/skel/.bashrc ~user/.bashrc &&\
    cp --backup=t /etc/skel/.profile ~user/.profile &&\
    cp --backup=t /etc/skel/.bash_logout ~user/.bash_logout

WORKDIR /home/user/app

CMD ["bash", "-c", "npm init -y &&\
    # npm install -D $(cat packages-dev.txt) &&\
    npm install $(cat packages.txt) &&\
    /bin/bash"]

RUN chown -R user:1000 /home/user/app

# USER user