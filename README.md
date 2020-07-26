# Nextcloud On Raspberry Pi with encryption supported by Veracrypt
Installing Nextcloud server on Raspberry Pi


# Platform / Hardware / Software
1. Raspbarry Pi 3B
1. 32GB flash memory for NextCloud server storage media 
1. NextCloud server
1. Raspbian Buster OS
1. Veracrypt

# Key Steps / Activities
1. Set up firewall (UFW) rules on Raspbarry Pi using https://github.com/ln-komandur/nextcloud-on-raspberry-pi/blob/master/ConfigureUFWRules.sh
1. Prepare NextCloud storage media (e.g. 32GB flash memory)
1. Install NextCloud using Snap
1. Configure user profiles
1. Install Veracrypt on client side across different supported platforms
  1. Create encryption containers of pre-defined size (e.g. 2GB) to store confidential files
  1. Add confidential files to Veracrypt on client side
  1. Sync Veracrypt encrytion container to NextCloud server
1. Sync NextCloud client side folders and files (including any Veracrypt encrytion containers) from various devices to NextCloud server


# Useful references
1. https://www.youtube.com/watch?v=BeqD6W7f2H4
1. https://www.veracrypt.fr/code/VeraCrypt/
