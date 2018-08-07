FROM prom/alertmanager:v0.15.1

COPY config.yml /etc/alertmanager/

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD        [ "-config.file=/etc/alertmanager/config.yml", \
             "-storage.path=/alertmanager" ]