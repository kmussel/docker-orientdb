# orientdb
#
# VERSION: see `TAG`
FROM ubuntu:14.04
MAINTAINER Kevin Musselman "kmussel@gmail.com"

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y openjdk-7-jdk && \
  rm -rf /var/lib/apt/lists/*

# RUN apt-get -y install openjdk-7-jre openjdk-7-jdk 
# cleanup install
# RUN apt-get -y -qq --force-yes clean \&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# system environment variables
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# install orientdb
ENV ORIENTDB_VERSION orientdb-community-2.1.2
ENV ORIENTDB_DOWNLOAD_URL http://www.orientechnologies.com/download.php?email=unknown@unknown.com&file=${ORIENTDB_VERSION}.tar.gz&os=linux
ENV ORIENTDB_ROOT_PASSWORD 0r13ntDB
ENV ORIENTDB_ROOT_DIR /usr/local/src/#{ORIENTDB_VERSION}
ADD ${ORIENTDB_DOWNLOAD_URL} /usr/local/src/orientdb-community.tar.gz
RUN cd /usr/local/src \
    && tar -xzf orientdb-community.tar.gz \
    && ln -s ${PWD}/${ORIENTDB_VERSION} ${PWD}/orientdb \
    && ln -s ${PWD}/orientdb/bin/* /usr/local/bin/ \
    && rm -rf ${PWD}/${ORIENTDB_VERSION}/databases \
    && ln -s ${PWD}/${ORIENTDB_VERSION}/databases /var/lib/orientdb \
    && rm ${PWD}/orientdb-community.tar.gz \
    && mkdir /usr/local/log

# configure system
EXPOSE 2424
EXPOSE 2480
CMD ["/usr/local/bin/server.sh"]