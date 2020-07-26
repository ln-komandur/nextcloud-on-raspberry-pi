# Nextcloud On Raspberry Pi with encryption supported by Veracrypt
Installing Nextcloud server on Raspberry Pi


# Platform / Hardware / Software
1. Raspbarry Pi 3B
2. 32GB flash memory for NextCloud server storage media 
3. NextCloud server
4. Raspbian Buster OS
5. Veracrypt

# Key Steps / Activities
1. Set up firewall (UFW) rules on Raspbarry Pe
2. Prepare NextCloud storage media (e.g. 32GB flash memory)
3. Install NextCloud using Snap
4. Configure user profiles
5. Install Veracrypt on client side across different supported platforms
- Create encryption containers of pre-defined size (e.g. 2GB) to store confidential files
- Add confidential files to Veracrypt on client side
- Sync Veracrypt encrytion container to NextCloud server
6. Sync NextCloud client side folders and files (including any Veracrypt encrytion containers) from various devices to NextCloud server


# Useful references
1. https://www.youtube.com/watch?v=BeqD6W7f2H4
2. https://www.veracrypt.fr/code/VeraCrypt/
