start=$SECONDS
ls ./k8s_min/*.json | xargs -P 3 -I % sh -c 'packer build --var-file % centos-base.json'
duration=$(( SECONDS - start ))
echo Duration: $duration seconds
