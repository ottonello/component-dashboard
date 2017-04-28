FROM ubuntu:latest

WORKDIR /src/app

COPY pp-dashboard.tar.gz /tmp
RUN tar -zxvf /tmp/component.tar.gz

EXPOSE 9000

CMD ["./run.sh"]
