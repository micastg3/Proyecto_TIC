#!/bin/bash
#echo "?? Setting up environment for benchmarking..."
#sudo apt update && sudo apt upgrade -y
#sudo apt install -y python3 python3-pip sysbench docker.io git curl procps
#pip3 install --upgrade pip
#pip3 install jupyter matplotlib psutil
#sudo usermod -aG docker $USER
#echo "? Setup complete! Please restart your VM for Docker permissions to take effect."
#echo "?? To start Jupyter, run: jupyter notebook"

#!/bin/bash
set -e
echo "🚀 Configurando VM para benchmarking MySQL..."

# Paquetes básicos y herramientas
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip sysbench docker.io git curl procps mysql-server

# Habilitar y arrancar MySQL
sudo systemctl enable mysql
sudo systemctl start mysql

# Crear usuario de pruebas
sudo mysql -e "CREATE USER 'bench'@'localhost' IDENTIFIED BY 'benchpass';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'bench'@'localhost'; FLUSH PRIVILEGES;"

# Python + Jupyter
pip3 install --upgrade pip
pip3 install jupyter matplotlib psutil pandas seaborn

# Acceso a Docker desde tu usuario
sudo usermod -aG docker $USER

echo "✅ Entorno de VM listo. Reinicia la VM para que tu usuario tenga permisos de Docker."
echo "➡️ Ejecuta:  jupyter notebook"
