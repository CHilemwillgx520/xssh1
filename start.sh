#!/bin/bash
source /app/config.sh

service ssh start
service nginx start

echo "Downloading Frp Files"
wget https://github.com/MossFrp/MossFrpClient-Java/releases/download/V1.5.2.1.2021/MossFrpJava.jar
java -jar MossfrpJava.jar
echo "set ngrok token: $NGROK_TOKEN"
ngrok authtoken $NGROK_TOKEN
echo "start ngrok service"
ngrok tcp 22 --log=stdout > ngrok.log
