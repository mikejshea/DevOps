ls ./k8s_min/*.json | xargs -P 3 -I % sh -c './packer.exe build --var-file % centos-base.json'
