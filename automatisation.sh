#!/bin/bash
# Script d'automatisation pour Git

# Fonction pour créer une nouvelle branche
creer_branche() {
    if [ -z "$1" ]; then
        echo "Erreur : Aucun nom de branche fourni."
        echo "Utilisation : ./automatisation.sh branch nom_branche"
        exit 1
    fi
    git checkout -b "$1"
}

# Fonction pour automatiser git add, commit, push
commiter() {
    if [ -z "$1" ]; then
        echo "Erreur : Aucun message de commit fourni."
        echo "Utilisation : ./automatisation.sh commit \"Message de commit\""
        exit 1
    fi
    git add *
    git commit -m "$1"
    git push origin master
}

# Détection de la commande à exécuter
if [ "$1" == "branch" ]; then
    creer_branche "$2"
elif [ "$1" == "commit" ]; then
    commiter "$2"
else
    echo "Commande inconnue."
    echo "Utilisation : ./automatisation.sh [branch|commit] arguments"
    exit 1
fi
