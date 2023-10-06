FROM hashicorp/tfc-agent:1.12.0

USER root
RUN mkdir -p /home/tfc-agent/.tfc-agent
ADD --chown=tfc-agent:tfc-agent hooks /home/tfc-agent/.tfc-agent/hooks


COPY /var/tmp/proxy.pem /usr/local/share/ca-certificates/proxy.crt
RUN update-ca-certificates


RUN mkdir -p /home/tfc-agent/.tfc-agent
ADD --chown=tfc-agent:tfc-agent hooks /home/tfc-agent/.tfc-agent/hooks
USER tfc-agent