# 🚀 My Web App

[![CI](https://github.com/USERNAME/my-web-app/actions/workflows/ci.yml/badge.svg)](https://github.com/USERNAME/my-web-app/actions/workflows/ci.yml)
[![CD](https://github.com/USERNAME/my-web-app/actions/workflows/cd.yml/badge.svg)](https://github.com/USERNAME/my-web-app/actions/workflows/cd.yml)
[![Docker](https://github.com/USERNAME/my-web-app/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/USERNAME/my-web-app/actions/workflows/docker-publish.yml)

> **Note** : Remplacez `USERNAME` par votre nom d'utilisateur GitHub dans les badges ci-dessus.

## 📋 Description

**My Web App** est une application web portfolio interactive avec un design moderne et des animations visuelles. Ce projet démontre la mise en place d'un pipeline CI/CD complet avec GitHub Actions.

## ✨ Fonctionnalités

- 🎨 Interface moderne avec animations de particules
- 📱 Design responsive
- 🐳 Containerisation Docker
- 🔄 Pipeline CI/CD automatisé

## 🛠️ Technologies

- **Frontend** : HTML5, CSS3, JavaScript
- **Containerisation** : Docker, Docker Compose
- **CI/CD** : GitHub Actions
- **Hébergement** : GitHub Pages, Docker Hub

## 🚀 Démarrage rapide

### Prérequis

- [Docker](https://www.docker.com/) installé
- [Git](https://git-scm.com/) installé

### Installation locale

```bash
# Cloner le dépôt
git clone https://github.com/USERNAME/my-web-app.git
cd my-web-app

# Lancer avec Docker Compose
docker-compose up -d

# Accéder à l'application
# Ouvrir http://localhost:8080 dans votre navigateur
```

### Construction manuelle

```bash
# Construire l'image Docker
docker build -t my-web-app .

# Lancer le conteneur
docker run -d -p 8080:80 my-web-app
```

## 📁 Structure du projet

```
my-web-app/
├── .github/
│   └── workflows/
│       ├── ci.yml              # Intégration continue
│       ├── cd.yml              # Déploiement GitHub Pages
│       ├── docker-publish.yml  # Publication Docker Hub
│       └── deploy-render.yml   # Déploiement Render
├── index.html                  # Page principale
├── features.html               # Page des fonctionnalités
├── style.css                   # Styles CSS
├── script.js                   # Scripts JavaScript
├── Dockerfile                  # Configuration Docker
├── docker-compose.yml          # Configuration Docker Compose
└── README.md                   # Documentation
```

## 🔄 Pipeline CI/CD

### Intégration Continue (CI)

Le workflow CI s'exécute à chaque push sur `main` et `dev` :

1. ✅ Validation des fichiers HTML
2. ✅ Construction de l'image Docker
3. ✅ Tests du conteneur
4. ✅ Génération d'artefacts

### Déploiement Continu (CD)

- **GitHub Pages** : Déploiement automatique sur push vers `main`
- **Docker Hub** : Publication de l'image à chaque release
- **Render** : Déploiement via webhook (optionnel)

## 🔐 Configuration des secrets

Pour utiliser les workflows, configurez ces secrets dans GitHub :

| Secret | Description |
|--------|-------------|
| `DOCKER_USERNAME` | Votre nom d'utilisateur Docker Hub |
| `DOCKER_PASSWORD` | Votre mot de passe ou token Docker Hub |
| `RENDER_DEPLOY_HOOK` | URL du webhook Render (optionnel) |

## 📊 Branches

- `main` : Branche de production
- `dev` : Branche de développement

## 🤝 Contribution

1. Fork le projet
2. Créer une branche (`git checkout -b feature/AmazingFeature`)
3. Commit les changements (`git commit -m 'Add AmazingFeature'`)
4. Push la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## 📝 Licence

Ce projet est sous licence MIT.

---

**Développé avec ❤️ pour le TP DevOps**
