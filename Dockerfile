FROM node:15.11.0

ENV WORKDIR '/src'

ENV HOST 0.0.0.0
ENV NUXT_PORT 3000 

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

RUN mkdir -p ${WORKDIR}
WORKDIR ${WORKDIR}



EXPOSE $NUXT_PORT

ENTRYPOINT ["/bin/bash", "/opt/entrypoint.sh"]