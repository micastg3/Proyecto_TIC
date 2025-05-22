#!/bin/bash
#echo "?? Setting up Docker environment for benchmarking..."
#sudo apt update && sudo apt upgrade -y
#sudo apt install -y python3 python3-pip sysbench git curl procps
#pip3 install --upgrade pip
#pip3 install jupyter matplotlib psutil
#echo "? Docker/WSL2 setup complete!"
#echo "?? To start Jupyter Notebook, run: jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser"

#!/bin/bash
set -e
echo "🐳 Configurando host/WSL para benchmarking Docker‑MySQL..."

sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip sysbench git curl procps docker.io docker-compose

pip3 install --upgrade pip
pip3 install jupyter matplotlib psutil pandas seaborn

echo "✅ Entorno Docker listo."
echo "➡️ Para levantar MySQL en contenedor: docker-compose -f ../docker-compose.yml up -d"
echo "➡️ Para abrir Jupyter: jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser"
