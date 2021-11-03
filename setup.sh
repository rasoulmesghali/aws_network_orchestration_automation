WD=$(pwd)

FILE1=${WD}/terraform/vpc_elastic_interfaces2.tf
FILE2=${WD}/terraform/vpc_route_tables2.tf

if [ -f $FILE1 ]; then
    mv "$FILE1" "${WD}/terraform/temp"
fi

if [ -f $FILE2 ]; then
    mv "$FILE2" "${WD}/terraform/temp"
fi

echo "Running terraform apply for the first time"
terraform -chdir="./terraform" init
terraform -chdir="./terraform" apply -auto-approve -lock=false
sleep 80

FILE1=${WD}/terraform/temp/vpc_elastic_interfaces2.tf
FILE2=${WD}/terraform/temp/vpc_route_tables2.tf

if [ -f $FILE1 ]; then
    mv "$FILE1" "${WD}/terraform"
fi

if [ -f $FILE2 ]; then
    mv "$FILE2" "${WD}/terraform"
fi
echo "Running terraform apply for the second time"
terraform -chdir="./terraform" apply -auto-approve -lock=false
sleep 140
ansible-playbook -i ${WD}/ansible_configs/hosts.cfg ${WD}/ansible_configs/siteA_router.yml 
ansible-playbook -i ${WD}/ansible_configs/hosts.cfg ${WD}/ansible_configs/siteB_router.yml 
ansible-playbook -i ${WD}/ansible_configs/hosts.cfg ${WD}/ansible_configs/central_router.yml