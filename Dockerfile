# Utiliser une image Nginx pour servir un site statique
FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 80
