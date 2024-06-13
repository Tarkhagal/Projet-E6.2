#!/bin/bash

# Définition des variables
BACKUP_DIR="/home/toto/Documents/Backup"  # Répertoire de sauvegarde
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")  # Horodatage pour nommer les fichiers de sauvegarde
LOGFILE="$BACKUP_DIR/backup_$TIMESTAMP.log"  # Fichier Log pour enregistrer les actions
VM_NAME="GLPI"  # Nom de la machine virtuelle à sauvegarder
VM_SNAPSHOT="backup_$TIMESTAMP"  # Nom de l'instantané basé sur l'horodatage

# S'assurer que le répertoire de sauvegarde existe
mkdir -p "$BACKUP_DIR"  # Crée le répertoire de sauvegarde s'il n'existe pas

# Journaliser le début de la sauvegarde
echo "Starting backup for $VM_NAME at $TIMESTAMP" | tee -a "$LOGFILE"  # Écrit le début de la sauvegarde dans le fichier Log

# Créer un instantané de la VM
VBoxManage snapshot "$VM_NAME" take "$VM_SNAPSHOT" --live | tee -a "$LOGFILE"  # Crée un instantané en direct de la VM et Log l'action

# Exporter la VM vers un fichier OVF
VBoxManage controlvm "$VM_NAME" savestate | tee -a "$LOGFILE"  # Met la VM en état de sauvegarde et Log l'action
VBoxManage export "$VM_NAME" -o "$BACKUP_DIR/${VM_NAME}_$TIMESTAMP.ovf" | tee -a "$LOGFILE"  # Exporte la VM dans un fichier OVF et Log l'action
VBoxManage startvm "$VM_NAME" --type headless | tee -a "$LOGFILE"  # Redémarre la VM en mode headless et Log l'action

# Supprimer l'instantané
VBoxManage snapshot "$VM_NAME" delete "$VM_SNAPSHOT" | tee -a "$LOGFILE"  # Supprime l'instantané créé précédemment et Log l'action

# Journaliser la fin de la sauvegarde
echo "Backup for $VM_NAME completed at $(date +"%Y%m%d%H%M%S")" | tee -a "$LOGFILE"  # Écrit la fin de la sauvegarde dans le fichier journal

# Supprimer les anciennes sauvegardes (conserver les 7 dernières)
find "$BACKUP_DIR" -type f -name "*.ovf" -mtime +7 -exec rm {} \;  # Supprime les fichiers OVF de plus de 7 jours

echo "Old backups cleaned up" | tee -a "$LOGFILE"  # Journalise le nettoyage des anciennes sauvegardes
