# Utilise Nginx pour servir un site statique
FROM nginx:alpine

# Copie tous les fichiers du projet dans le dossier web de Nginx
COPY . /usr/share/nginx/html

# Expose le port 80
EXPOSE 80
