# Run this script as the first thing you do after a newly created vps. 
# Tested on Ubuntu 18.04 on DigitalOcean droplets, but should work on any provider
echo "Specify a username for the new user: "
read NEW_USER
echo "Using '$NEW_USER' as username"

# Update and upgrade packages
apt-get update && apt-get upgrade -y

# Add user
adduser $NEW_USER

# Add user to sudoers
usermod -aG sudo $NEW_USER

# Copy all ssh files from root to newly created user
rsync --archive --chown=$NEW_USER:$NEW_USER ~/.ssh /home/$NEW_USER

# Disallow root login
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config

# Disallow any SSH login, ensure "ChallengeResponseAuthentication no" as well
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# Disallow PAM, which may otherwise allow password logins
sed -i 's/^UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
service ssh restart

echo "Make sure you can login as the new user before closing this shell. Then run setup_user.sh as the new user."
