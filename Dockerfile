FROM octohost/ubuntu

RUN apt-get install -y wget

ADD ./ddns.sh /ddns.sh

RUN chmod 755 /ddns.sh

# NO_HTTP_PROXY

CMD ["/ddns.sh"]
