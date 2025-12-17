#!/bin/bash

# -----------------------------
# CONFIGURATION
# -----------------------------
VPS_USER="user"                 # remplace par ton user SSH
VPS_IP="IP_DU_VPS"              # remplace par l'IP de ton VPS
VPS_DIR="/home/$VPS_USER/my-web-app"  # dossier du projet sur le VPS

LOCAL_PROJECT_DIR="$(pwd)"       # dossier local du projet

# -----------------------------
# TRANSFERT DES FICHIERS
# -----------------------------
echo "📦 Transfert des fichiers vers le VPS..."
scp -r "$LOCAL_PROJECT_DIR/"* "$VPS_USER@$VPS_IP:$VPS_DIR"

# -----------------------------
# CONNEXION SSH ET DEPLOIEMENT
# -----------------------------
echo "🚀 Déploiement sur le VPS..."
ssh "$VPS_USER@$VPS_IP" << EOF
    mkdir -p $VPS_DIR
    cd $VPS_DIR
    docker-compose down
    docker-compose up -d --build
EOF

echo "✅ Déploiement terminé !"
echo "🌐 Votre app est accessible sur http://$VPS_IP:8080"
