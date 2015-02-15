FROM java:8-jdk

#Install utils
RUN apt-get install -y wget

RUN wget http://apache.mirrors.spacedump.net/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz

RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /etc \
    && mv /etc/zookeeper-3.4.6 /etc/zookeeper \
    && mkdir /var/lib/zookeeper

ADD zoo.cfg /etc/zookeeper/conf/zoo.cfg

EXPOSE 2181 2888 3888

# Deploy startup script
ADD init.sh /usr/local/bin/start-zookeeper
RUN chmod 755 /usr/local/bin/start-zookeeper

#CMD /usr/local/bin/start-zookeeper
#ENTRYPOINT ["/etc/zookeeper/bin/zkServer.sh"]
#CMD ["start-foreground"]

CMD /bin/bash