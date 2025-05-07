# FROM hashicorp/tfc-agent:latest
FROM hashicorp/tfc-agent:1.17.2

USER root

# Example: Add your own certificates to the environment
COPY proxy.pem /usr/local/share/ca-certificates/proxy.crt
RUN update-ca-certificates

# install the AWS cli binary on the agent
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/*


RUN mkdir -p /home/tfc-agent/.tfc-agent
ADD --chown=tfc-agent:tfc-agent hooks /home/tfc-agent/.tfc-agent/hooks
RUN chmod +x /home/tfc-agent/.tfc-agent/hooks/*
USER tfc-agent
 
