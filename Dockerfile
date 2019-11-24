FROM buildbot/buildbot-worker:v2.1.0

USER root

RUN apt-get update && \
    apt-get install -y \
            apt-transport-https \
            ca-certificates \
            iputils-ping \
            net-tools \
            software-properties-common \
            lsb-release

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-get update && \
    apt-get install -y docker-ce=18.06.3~ce~3-0~ubuntu  

RUN pip install --upgrade pip && \
    pip install docker-compose==1.25.0
