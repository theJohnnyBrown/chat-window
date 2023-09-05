FROM node:18.17-alpine AS node

RUN mkdir /app
WORKDIR /app
COPY ./components /app/components
COPY ./helpers /app/helpers
COPY ./next-env.d.ts /app/
COPY ./package-lock.json /app/
COPY ./package.json /app/
COPY ./pages /app/pages
COPY ./public /app/public
COPY ./styles /app/styles
COPY ./tsconfig.json /app/

RUN /usr/local/bin/npm install
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN /usr/local/bin/npm run-script build
CMD [ "/usr/local/bin/npm", "run-script", "start" ]
