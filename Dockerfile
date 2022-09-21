FROM node:current-alpine as build
WORKDIR /usr/src/app
COPY package.json .
COPY src src
COPY tsconfig.json .
COPY yarn.lock .
COPY .yarnrc.yml .
COPY .yarn/releases/yarn* .yarn/releases/
RUN yarn --dev
RUN yarn tsc

FROM node:current-alpine
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/out out
CMD [ "node", "out/main.js" ]
