FROM ubuntu:latest

WORKDIR /src/app

COPY component-dashboard.tar.gz /tmp
RUN tar -zxvf /tmp/component-dashboard.tar.gz

EXPOSE 9000

CMD ["./run.sh"]
