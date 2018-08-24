FROM node:10.8.0-stretch
ENV NODE_ENV production
WORKDIR /usr/defensor/e2eTest
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent
COPY . .