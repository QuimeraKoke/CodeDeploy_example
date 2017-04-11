# General Config (Init)
echo "Gen. Config"
sudo apt-get update
sudo apt-get install python-pip -y
sudo pip install virtualenv
mkdir $HOME/virtual_envs
virtualenv $HOME/virtual_envs/code_deploy
source $HOME/virtual_envs/code_deploy/bin/activate
pip install --upgrade pip
pip install -r /vagrant/Assets/requirements.txt

echo "Provisioning Code "
sudo mkdir /var/code_deploy
sudo chown ubuntu:www-data /var/code_deploy
ln -s /vagrant/Code /var/code_deploy/Code

echo "Gunicorn"
sudo cp /vagrant/Assets/gunicorn.conf /etc/systemd/system/
sudo mv /etc/systemd/system/gunicorn.conf /etc/systemd/system/codeploy.service
sudo systemctl start codeploy.service
sudo systemctl enable codeploy.service

echo "NgineX"
sudo apt-get install nginx -y
sudo cp /vagrant/Assets/nginx.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/codedeploy
sudo nginx -t
sudo systemctl reload nginx