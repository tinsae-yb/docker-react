FROM node:16.13.0-alpine as builder

WORKDIR /react-web
COPY package.json .

RUN npm install



COPY . . 


CMD ["yarn" , "build"] 



FROM nginx

COPY --from=builder /react-web/build /usr/share/nginx/html


