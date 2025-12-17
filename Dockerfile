# Étape 1 : Utiliser une image Nginx légère
FROM nginx:alpine

# Étape 2 : Supprimer le contenu par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Étape 3 : Copier tous les fichiers du projet dans le dossier Nginx
COPY . /usr/share/nginx/html

# Étape 4 : Exposer le port 8080
EXPOSE 8080

# Étape 5 : Lancer Nginx en mode foreground
CMD ["nginx", "-g", "daemon off;"]
