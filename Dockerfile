FROM python:alpine
LABEL org.opencontainers.image.source https://github.com/opensentinel/aws-kubectl

RUN apk --no-cache add curl
ADD run.sh /run.sh

# Install kubectl
# version: https://storage.googleapis.com/kubernetes-release/release/stable.txt
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.20.0/bin/linux/amd64/kubectl \
	&& mv kubectl /usr/local/bin \
	&& chmod +x /usr/local/bin/kubectl

RUN adduser -S user
USER user
WORKDIR /home/user
ENV PATH /usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/user/.local/bin

# Install awscli
RUN pip install awscli --upgrade --user

ENTRYPOINT ["/run.sh"]
