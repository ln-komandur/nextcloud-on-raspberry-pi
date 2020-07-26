echo "Please run this script with root (sudo) privileges"
echo
echo "--------------------------------------------------"
echo "Your router's IP address can be found below" 
# This command shows your router's ip address. e.g. 192.168.254.254
ip route show default

echo
echo "--------------------------------------------------"
echo "Your IP address and subnet mask can be found below"
# This command shows your subnet mask (255.255.255.0), your ip address (192.168.254.24) apart from other details 
ifconfig -a 

# In the below rules, 192.168.254.0/24 is CIDR format. 
# CIDR notation (Classless Inter-Domain Routing) is an alternate method of representing a subnet mask. 
# It is simply a count of the number of network bits (bits that are set to 1) in the subnet mask. 
# The /24 is referring to the subnet mask & indicates that the first 24 bits of the address are masked (255.255.255.0)
# Useful reference at http://www.controltechnology.com/Files/common-documents/application_notes/CIDR-Notation-Tutorial 
echo
echo "--------------------------------------------------"
echo "Allow all incoming SSH from Subnet" 
#SSH runs on port 22
ufw allow from 192.168.254.0/24 to any port 22 proto tcp
echo
echo "--------------------------------------------------"
#HTTP runs on port 80
echo "Allow all incoming HTTP from Subnet"
ufw allow from 192.168.254.0/24 to any port 80 proto tcp
echo
echo "--------------------------------------------------"
#NextCloud is configured to run on port 441. Edit this rule if different
echo "Allow all incoming from Subnet to port 441 on which NextCloud is/will be running. Edit this rule if different"
ufw allow from 192.168.254.0/24 to any port 441 proto tcp
echo
echo "--------------------------------------------------"
#VNC is configured to run on port 5900. Edit this rule if different
echo "Allow all incoming from Subnet to port 5900 on which VNC is/will be running. Edit this rule if different"
ufw allow from 192.168.254.0/24 to any port 5900 proto tcp
echo
echo "--------------------------------------------------"
#Need to disable and enable UFW for new rules to take effect
echo "Disabling UFW rules before re-enabling it"
ufw disable        
echo
echo "--------------------------------------------------"
echo "Enabling UFW to effect new rules"
ufw enable        
echo
echo "--------------------------------------------------"
echo "UFW status after updating rules is"
ufw status 
