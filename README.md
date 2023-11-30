[![Bash](https://img.shields.io/badge/Language-Bash-blue?logo=gnu-bash)](https://www.gnu.org/software/bash/)

# 🚀 Script de Validation DNS et Génération de Certificats SSL/TLS avec Let's Encrypt

Ce script Bash facilite la validation DNS préalable pour un ensemble de domaines, suivi de la génération des certificats SSL/TLS avec Let's Encrypt.

## 🎯 Paramètres

- **domains :** Liste des domaines à valider, séparés par des virgules.
- **email :** Votre adresse e-mail pour les notifications de Let's Encrypt.
- **ip :** Votre adresse IP de référence pour la validation.
- **sslok :** 1 pour générer les certificats, 0 pour la validation uniquement.

## ⚙️ Configuration

- **Webroot :** Assurez-vous que le répertoire webroot spécifié existe et a les bonnes permissions pour Certbot.

## 📝 Licence

Ce script est distribué sous la licence [MIT](LICENSE).
