FROM octohost/ubuntu:13.10

RUN apt-get install -y wget

ADD ./ddns.sh /ddns.sh

RUN chmod 755 /ddns.sh

# NO_HTTP_PROXY

CMD ["/ddns.sh"]
