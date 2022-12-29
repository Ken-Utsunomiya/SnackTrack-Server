FROM node:14.15.4-alpine3.12

LABEL version="1.1"
LABEL description="This is prod Dockerfile for the backend of SnackTrack app."

ENV APP_HOME /app
ENV PORT 5000
ENV PATH /app/node_modules/.bin:$PATH

WORKDIR ${APP_HOME}

COPY package.json .

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && yarn install \
    && yarn set version 1.22.10

COPY . .

EXPOSE ${PORT}

CMD [ "yarn", "run", "start" ]