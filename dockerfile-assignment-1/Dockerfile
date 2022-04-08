
FROM node:alpine3.14
# Test change
RUN apk add --no-cache tini
#RUN mkdir -p /usr/src/app  ---- Showed in example from Bret but we shouldn't have to specify since WORKDIR will automatically create it (saw this in another post)
WORKDIR usr/src/app
COPY package.json package.json
RUN npm install && npm cache clean --force
COPY . .

EXPOSE 3000

CMD ["tini", "--", "node", "./bin/www"]