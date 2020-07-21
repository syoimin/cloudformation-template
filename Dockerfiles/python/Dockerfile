FROM python:3.7-alpine

ENV NODE_PATH /usr/lib/node_modules/
# install nodejs
RUN apk update \
    && apk add --no-cache nodejs npm

# install aws-cli
RUN pip install awscli

# cloudformation lint
RUN npm install -g cfn-lint

# change work directory
RUN mkdir -p /app
WORKDIR /app