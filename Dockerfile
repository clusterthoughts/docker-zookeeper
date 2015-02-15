FROM dockerfile/java:oracle-java8

#Install utils
RUN apt-get install -y wget

RUN wget http://apache.mirrors.spacedump.net/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz

RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /etc \
    && mv /etc/zookeeper-3.4.6 /etc/zookeeper \
    && mkdir /var/lib/zookeeper

ADD zoo.cfg /etc/zookeeper/conf/zoo.cfg

# Deploy startup script
ADD init.sh /etc/zookeeper/bin/start-zookeeper
RUN chmod 755 /etc/zookeeper/bin/start-zookeeper

EXPOSE 2181 2888 3888 5111

CMD /etc/zookeeper/bin/start-zookeeper