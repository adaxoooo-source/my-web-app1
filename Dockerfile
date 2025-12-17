# Étape 1 : Utiliser une image Nginx légère
FROM nginx:alpine

# Étape 2 : Supprimer le contenu par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Étape 3 : Copier tous les fichiers du projet dans le dossier Nginx
COPY . /usr/share/nginx/html


