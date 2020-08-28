cd ~
sudo apt-get install cmake libjpeg8-dev git

mkdir ~/lili
cd ~/lili

git clone --depth=1 https://github.com/robotpy/mjpg-streamer.git

cd ~/lili/mjpg-streamer/mjpg-streamer-experimental
make
sudo make install
export LD_LIBRARY_PATH=.
./mjpg_streamer -o "output_http.so -w ./www" -i "input_raspicam.so"
cd ../../


cd ~
