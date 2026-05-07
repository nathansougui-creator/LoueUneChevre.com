# On part d'une image Linux légère avec Node.js 20 déjà installé
FROM node:20-alpine

# On définit le dossier de travail dans le conteneur
WORKDIR /app

# On copie d'abord le fichier des dépendances
COPY services/api/package*.json ./services/api/

# On installe les dépendances (sans celles de développement)
RUN npm install --prefix services/api --omit=dev

# On copie le code source de l'API
COPY services/api/src/ ./services/api/src/

# On indique que l'API écoute sur le port 3001
EXPOSE 3001

# Commande pour démarrer l'API quand le conteneur se lance
CMD ["node", "services/api/src/server.js"]
