sudo apt-get update
sudo apt-get install net-tools
sudo apt install iputils-ping
pip install httpie

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "../awscliv2.zip"
unzip -o ../awscliv2.zip
sudo ./aws/install

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
