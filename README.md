# Projet-E6.2

Report on My 200-Hour School Project: IT Park Manager, Backup System, and Networking

This document presents the detailed report of my 200-hour school project, which focused on managing an IT park, developing a backup system, and enhancing networking infrastructure. This project was conducted in the Polypeptide stand-alone environment.
I would like to extend my gratitude to Polypeptide for providing me the opportunity to undertake and complete this project.

Automated Snapshot Script (snapshot.sh):
This script automates the snapshot process in VirtualBox, eliminating the need for manual intervention. By using this script, we ensure that regular snapshots of virtual machines are taken, providing a reliable point of recovery in case of issues.

OVF Export Script:
This additional Bash script exports the GLPI VM as an .OVF file from VirtualBox. This export facilitates the backup process, allowing us to have a restorable copy of the virtual machine in case of problems with our physical server. These scripts significantly enhance our system's resilience and ensure that we can quickly recover from any hardware failures or other issues.

Crontab in Linux:
Crontab is used to schedule tasks in Linux. For example, we use crontab to schedule our two scripts: one to take snapshots and another to export .ovf files from VirtualBox.

Crontab Syntax
The syntax of a crontab entry consists of five time and date fields followed by the command to be executed:

![image](https://github.com/Tarkhagal/Projet-E6.2/assets/145452931/04478a46-c384-452d-8813-1c48a656e1c8)


Example Crontab Entries
Run the Snapshot Script Daily at Midnight
0 0 * * * /path/to/snapshot.sh
Run the OVF Export Script Weekly at 2:00 AM on Sundays:
0 2 * * 0 /path/to/ovf-export.sh

  ![Stand-Alone-Network-MCLAG-ICL](https://github.com/Tarkhagal/Projet-E6.2/assets/145452931/2a0c04dd-8a93-4eff-8cd5-8af51e60da1b)

In this image, we can see our triangular-shaped network that utilizes MC-LAG (Multi-Chassis Link Aggregation Group) and ICL (Inter-Chassis Link) technology. These technologies offer several advantages, including improved redundancy, increased bandwidth, and enhanced network resilience. By implementing MC-LAG and ICL, our network ensures high availability and seamless failover, leading to more reliable and efficient operations.


![image](https://github.com/Tarkhagal/Projet-E6.2/assets/145452931/643d4c4b-c153-455f-b0ae-6ad7fa3b81d3)


In this image, we can see that I use GLPI, which stands for "Gestionnaire Libre de Parc Informatique" (Free IT Equipment Manager). I chose GLPI because it is simple to install on a Debian server, is open source, and allows for the addition of various plugins. In this case, I am using the GLPI Inventory plugin to track our laptops, PCs, software licenses, monitors, and other equipment.

![image](https://github.com/Tarkhagal/Projet-E6.2/assets/145452931/fdf05ae4-1ea9-46bd-b268-455e4e0fb1e3)


Lastly, in this image, we can see our backup server, which is called Proxmox Backup. With this software, we can back up virtual machines, containers, host systems, and various files. In our case, we are using it to back up our exported .ovf files from VirtualBox.
