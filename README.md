# Projet-E6.2

Report on My 200-Hour School Project: IT Park Manager, Backup System, and Networking

This document presents the detailed report of my 200-hour school project, which focused on managing an IT park, developing a backup system, and enhancing networking infrastructure. This project was conducted in the Polypeptide stand-alone environment.
I would like to extend my gratitude to Polypeptide for providing me the opportunity to undertake and complete this project.

Automated Snapshot and Backup Scripts
As part of this project, I developed two key scripts to enhance our backup and recovery processes:

Automated Snapshot Script (snapshot.sh):
This script automates the snapshot process in VirtualBox, eliminating the need for manual intervention. By using this script, we ensure that regular snapshots of virtual machines are taken, providing a reliable point of recovery in case of issues.

OVF Export Script:
This additional Bash script exports the GLPI VM as an .OVF file from VirtualBox. This export facilitates the backup process, allowing us to have a restorable copy of the virtual machine in case of problems with our physical server.
These scripts significantly enhance our system's resilience and ensure that we can quickly recover from any hardware failures or other issues.
