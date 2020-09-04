cd ~
sudo apt-get update -y && sudo apt-get upgrade -y 

sudo apt-get install -y cmake libjpeg8-dev git

mkdir ~/lili
cd ~/lili

git clone --depth=1 https://github.com/robotpy/mjpg-streamer.git

cd ~/lili/mjpg-streamer/mjpg-streamer-experimental
make
sudo make install
export LD_LIBRARY_PATH=.
./mjpg_streamer -o "output_http.so -w ./www" -i "input_raspicam.so"
cd ../../

# Based on: https://www.pyimagesearch.com/2019/09/16/install-opencv-4-on-raspberry-pi-4-and-raspbian-buster/

sudo apt-get install -y build-essential cmake pkg-config
sudo apt-get install -y libjpeg-dev libtiff5-dev libjasper-dev libpng-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev

sudo apt-get install -y libfontconfig1-dev libcairo2-dev
sudo apt-get install -y libgdk-pixbuf2.0-dev libpango1.0-dev
sudo apt-get install -y libgtk2.0-dev libgtk-3-dev

sudo apt-get install -y libatlas-base-dev gfortran

sudo apt-get install -y libhdf5-dev libhdf5-serial-dev libhdf5-103
sudo apt-get install -y libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5

sudo apt-get install -y python3-dev

wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo python3 get-pip.py
sudo rm -rf ~/.cache/pip

sudo pip install virtualenv virtualenvwrapper

echo " " >> ~/.bashrc
echo "# virtualenv and virtualenvwrapper" >> ~/.bashrc
echo "export WORKON_HOME=$HOME/.virtualenvs"  >>  ~/.bashrc
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc

source ~/.bashrc
mkvirtualenv cv -p python3
pip install "picamera[array]"

cd ~

pip install scikit-build
pip install opencv-contrib-python==4.4.0.42
pip install opencv-python==4.4.0.42
