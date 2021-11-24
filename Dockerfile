FROM node:alpine as build

RUN npm install --global html-minifier

COPY index.html /index.html
RUN html-minifier --collapse-whitespace --remove-comments --remove-optional-tags \
                  --remove-redundant-attributes --remove-script-type-attributes \
                  --remove-tag-whitespace --use-short-doctype --minify-css true --minify-js true /index.html -o /index.html.min



FROM nginx:stable-alpine

COPY . /usr/share/nginx/html/
COPY --from=build /index.html.min  /usr/share/nginx/html/index.html
