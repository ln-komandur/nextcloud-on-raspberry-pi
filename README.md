# Nextcloud On Raspberry Pi with encryption supported by Veracrypt
Installing Nextcloud server on Raspberry Pi


# Platform / Hardware / Software
1. Raspbarry Pi 3B
1. 32GB flash memory for NextCloud server storage media 
1. Nextcloud server
1. Raspbian Buster OS
1. Veracrypt

# Key Steps / Activities

## Raspberry Pi Configuration

### SSH & Firewall
1. Update your Raspberry Pi before any installations using `sudo apt-get update`
1. Enable SSH if it is not already enabled using one of the following methods
   1. From the terminal using `sudo raspi-config`, selecting "Interfaces" and "SSH"
   1. From the GUI clicking "Preferences -> Raspberry Pi Configuration -> Interfaces", selecting the "Enable" radio button next to SSH
1. Install Uncomplicated Fire Wall (UFW) if it is not already installed using `sudo apt install ufw'
1. Set up firewall (UFW) rules on Raspbarry Pi using https://github.com/ln-komandur/nextcloud-on-raspberry-pi/blob/master/ConfigureUFWRules.sh

### Nextcloud installation
1. Install the Snap Daemon if not installed already using `sudo apt install snapd`
1. Install nextcloud and its dependencies (Apache web server, PHP etc.) using `sudo snap install nextcloud`

## Preparing the storage media for cloud data

### Mounting the media
1. Plug in your chosen USB media (e.g. in my case a 32GB micro SD card plugged into a USB card reader adapter) to use for cloud data storage
1. Format it as "ext4" and label it (e.g. "mynxtcld") using "GParted" (under "System Tools" menu in the GUI)
1. Create a mount point for your media by creating a directory under the '/media' directory using `sudo mkdir /media/mynxtcld`
1. Make yourself the owner for this folder using `sudo chown <your-user-id> -hR /media/mynxtcld/`
1. Configure it to mount on start-up  
   1. Find the UUID of the media by executing `sudo blkid | grep UUID=` or by using `ls -l /dev/disk/by-uuid`
   1. Add the line to the '/etc/fstab' file as below, editing it with `sudo` privileges
      1. UUID=\<unique id of your media><tab\>_/media/mynxtcld_\<tab>_auto_\<tab>_nosuid,nodev,nofail_\<tab>_0_\<tab>_0_
1. Mount the media with the command `sudo mount -a`

### Pointing nextcloud to the media mount point

1. Edit the `/var/snap/nextcloud/current/nextcloud/config/autoconfig.php` file to have `'directory'=>'/media/mynxtcld',`. Do not forget the trailing comma as this entry will be inside the `array(`
1. Restart nextcloud server with `sudo snap restart nextcloud.php-fpm`

## Enabling https
1. Find where nextcloud https is sitting in your Raspberry Pi by executing `whereis nextcloud.enable-https`
1. Use a self signed certificate by executing `sudo /snap/bin/nextcloud.enable-https self-signed` 
1. Set https port to 441, by executing `sudo snap set nextcloud ports.https=441` . Remember we already allowed port 441 in the UFW set-up.
1. Restart nextcloud server with `sudo snap restart nextcloud.php-fpm`
 

## Nextcloud client configuration

1. Use a browser on a client PC to connect to your nextcloud server on the Raspberry Pi by using https://<RaspberryPi_IP_Addr>:441 for the URL
1. Create a username and password, and click "Finish set-up"
1. Login, create additional user accounts and configure their profiles
1. Download and install nextcloud client on different client platforms
1. Configure folders to sync with nextcloud server

## Using Veracrypt for storing confidential files on nextcloud

1. Install Veracrypt on client side across different supported platforms
   1. Create encryption containers of pre-defined size (e.g. 2GB) to store confidential files
   1. Add confidential files to Veracrypt on client side
   1. Sync Veracrypt encrytion container to nextcloud server
1. Sync nextcloud client side folders and files (including any Veracrypt encrytion containers) from various devices to nextcloud server


# Useful references
1. https://www.youtube.com/watch?v=BeqD6W7f2H4
1. https://www.veracrypt.fr/code/VeraCrypt/
