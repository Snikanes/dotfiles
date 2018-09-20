# Setup ssh-agent to start on boot
# Make sure that the .zshrc has set shell variable for socket
sudo cp ./ssh-agent.service /etc/systemd/system

# Generate ssh key for git etc.
# -a increases the rounds, increasing the resistance to brute-force cracking
ssh-keygen -o -a 100 -t ed25519

# Make sure keys are added once agent starts
echo "AddKeysToAgent yes" > ~/.ssh/config

# Enable the service and start it right away
sudo systemctl enable ssh-agent
sudo systemctl start ssh-agent