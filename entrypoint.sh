#!/bin/sh

pip3 install -r /requirements.txt
python3 /prepare.py --service-name $2 --service-replica-count $3 --image-name $4 --image-namespace $5 --version $(cat release_version.txt) --service-envvars "$6"
if [ "$1" = true ] ; then
    cat /service/values.yaml
fi
cp -rp /service service
echo "VERSION_NUMBER=$(cat release_version.txt)" >> $GITHUB_ENV