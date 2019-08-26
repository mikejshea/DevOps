ls ./overwatch/*.json | xargs -P 3 -I % sh -c 'packer build --var-file % centos-base.json'
