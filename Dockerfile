FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

FROM nginx
# expose port for aws elastic beanstalk port mapping
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
