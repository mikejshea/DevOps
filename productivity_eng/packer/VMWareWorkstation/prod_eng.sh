start=$SECONDS
PACKER_KEY_INTERVAL=10ms packer build ubuntu1804-Desktop.json
duration=$(( SECONDS - start ))
echo Duration: $duration seconds
