#!/bin/bash

# Créer le dossier du projet
mkdir -p my-web-app
cd my-web-app

# Créer index.html
cat <<EOL > index.html
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Web App - Docker CI/CD</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>🚀 My Web App</h1>
        <p>Pipeline CI/CD et Docker Desktop en action !</p>
        <p>Le site est servi depuis un container Docker sur le port <strong>80</strong>.</p>
        <div class="status">
            <span class="dot running"></span>
            <span>Container en cours d'exécution ✅</span>
        </div>
        <p>Profitez de votre site web statique moderne.</p>
    </div>
    <script src="script.js"></script>
</body>
</html>
EOL

# Créer style.css
cat <<EOL > style.css
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    text-align: center;
    padding: 50px;
    background: linear-gradient(135deg, #1d2671, #c33764);
    color: white;
}

.container {
    background: rgba(0,0,0,0.5);
    padding: 30px;
    border-radius: 15px;
    display: inline-block;
}

h1 {
    font-size: 2.5em;
    margin-bottom: 10px;
}

p {
    font-size: 1.2em;
}

.status {
    margin: 20px 0;
    font-size: 1.1em;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
}

.dot {
    height: 15px;
    width: 15px;
    border-radius: 50%;
    display: inline-block;
}

.running {
    background-color: #4caf50;
}
EOL

# Créer script.js
cat <<EOL > script.js
console.log("My Web App est servi depuis Docker Desktop !");
EOL

# Créer Dockerfile
cat <<EOL > Dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
EOL

# Créer .gitignore
cat <<EOL > .gitignore
node_modules/
*.log
.DS_Store
EOL

# Créer dossiers GitHub Actions
mkdir -p .github/workflows

# Créer ci.yml
cat <<EOL > .github/workflows/ci.yml
name: CI

on:
  push:
    branches:
      - dev
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v3

    - name: Verify index.html exists
      run: |
        if [ ! -f index.html ]; then
          echo "index.html not found!"
          exit 1
        fi

    - name: Build Docker image
      run: docker build -t my-web-app-ci .
EOL

# Créer cd.yml
cat <<EOL > .github/workflows/cd.yml
name: CD

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v3

    - name: Build Docker image
      run: docker build -t my-web-app .

    - name: Deploy to GitHub Pages
      uses: actions/configure-pages@v3

    - name: Upload artifact
      uses: actions/upload-pages-artifact@v1
      with:
        path: ./

    - name: Deploy
      uses: actions/deploy-pages@v1
EOL

# Créer README.md
cat <<EOL > README.md
# My Web App

Site web statique moderne pour tester CI/CD et Docker Desktop.

- CI sur \`dev\` : vérification des fichiers + build Docker
- CD sur \`main\` : build Docker + déploiement sur GitHub Pages
EOL

echo "✅ Projet my-web-app créé avec succès !"
