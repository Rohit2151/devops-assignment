sudo apt-get update -y

sudo apt-get install -y docker.io git

sudo systemctl start docker
sudo systemctl enable docker

# Clone the application repo 
APP_DIR="/home/ubuntu/devops-assignment"
if [ ! -d "$APP_DIR" ]; then
  git clone https://github.com/YOUR_GITHUB_USER/devops-assignment.git $APP_DIR
else
  echo "Repository already exists at $APP_DIR, pulling latest changes..."
  cd $APP_DIR && git pull
fi
