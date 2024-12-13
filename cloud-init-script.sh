#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo docker pull nill2/face_detection:latest
sudo docker run -d -p 80:5000 nill2/face_detection:latest
