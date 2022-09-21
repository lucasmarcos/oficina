FROM node:current-alpine
WORKDIR /usr/src/app
COPY . .
RUN yarn
RUN yarn tsc
CMD [ "node", "out/main.js" ]
