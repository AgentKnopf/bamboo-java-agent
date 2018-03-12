FROM atlassian/bamboo-java-agent
# Origin for this dockerfile: https://jira.atlassian.com/browse/BAM-17492 (still no JDK 8)
RUN apt-get update && apt-get install -y \
  python-software-properties \
  software-properties-common

# Get the open JDK version 8
RUN add-apt-repository ppa:openjdk-r/ppa && \
  apt-get update && \
  apt-get install -y openjdk-8-jdk \
  openjdk-8-jre

RUN echo 2 | update-alternatives --config java && \
  echo 2 | update-alternatives --config javac
  
# Get curl and remove downloaded packages afterwards
RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists

# Get git
RUN apt-get update && apt-get install -y git && apt-get clean && rm -rf /var/lib/apt/lists
