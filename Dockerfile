#FROM jenkins/jenkins:2.414.2-jdk11
#USER root
#RUN apt-get update && apt-get install -y lsb-release python3-pip
#RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
#  https://download.docker.com/linux/debian/gpg
#RUN echo "deb [arch=$(dpkg --print-architecture) \
#  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
#  https://download.docker.com/linux/debian \
#  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
#RUN apt-get update && apt-get install -y docker-ce-cli
#USER jenkins
#RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"



FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y lsb-release python3-pip
RUN curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
#RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
