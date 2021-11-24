FROM node:14.17.6
ENV NODE_ENV production
WORKDIR /app
COPY . /app/
RUN npm ci --only=production

FROM alpine
ENV NODE_ENV production
RUN apk add --update nodejs npm
COPY --from=0 /app /app

ENTRYPOINT ["/app/bin/mqtt-streamr.js"]

