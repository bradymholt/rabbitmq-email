FROM rabbitmq:3-management
RUN apt-get update
RUN apt-get install unzip
ADD https://dl.bintray.com/rabbitmq/community-plugins/3.7.x/rabbitmq_email/rabbitmq_email-20171206-3.7.x.zip /tmp
RUN unzip /tmp/rabbitmq_email-20171206-3.7.x.zip -d /plugins
COPY advanced.config /etc/rabbitmq/
COPY docker-entrypoint-primary.sh /
RUN echo "[rabbitmq_management,gen_smtp,rabbitmq_email]." > /etc/rabbitmq/enabled_plugins
ENTRYPOINT ["/docker-entrypoint-primary.sh"]
CMD ["rabbitmq-server"]