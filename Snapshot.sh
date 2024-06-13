#!/bin/bash

# Vérifie et définit LOGNAME et USER s'ils ne correspondent pas à l'identifiant utilisateur effectif
EFFECTIVE_USER=$(id -un)  # Récupère le nom de l'utilisateur effectif
if [ "$LOGNAME" != "$EFFECTIVE_USER" ]; then
    export LOGNAME=$EFFECTIVE_USER  # Définit LOGNAME à l'utilisateur effectif si différent
fi
if [ "$USER" != "$EFFECTIVE_USER" ]; then
    export USER=$EFFECTIVE_USER  # Définit USER à l'utilisateur effectif si différent
fi

# Définir le nom de la machine virtuelle
VM_NAME="GLPI"

# Vérifie si le nom de la machine virtuelle est fourni
if [ -z "$VM_NAME" ]; then
    echo "ERROR: VM name is not specified."  # Affiche une erreur si le nom de la VM n'est pas spécifié
    exit 1  # Quitte le script avec un code d'erreur
fi

# Prend un instantané de la VM
VBoxManage snapshot "$VM_NAME" take "Snapshot $(date '+%Y-%m-%d %H:%M:%S')" --description "Automatic snapshot"
if [ $? -eq 0 ]; then  # Vérifie si la commande précédente s'est exécutée avec succès
    echo "Snapshot taken successfully for VM: $VM_NAME"  # Affiche un message de succès
else
    echo "Failed to take snapshot for VM: $VM_NAME"  # Affiche un message d'échec
    exit 1  # Quitte le script avec un code d'erreur
fi
