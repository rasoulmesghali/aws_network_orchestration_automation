terraform -chdir="./terraform" destroy -auto-approve -lock=false

WD=$(pwd)

FILE1=terraform/vpc_elastic_interfaces2.tf
FILE2=terraform/vpc_route_tables2.tf

if [ -f $FILE1 ]; then
    mv "$FILE1" "${WD}/terraform/temp"
fi

if [ -f $FILE2 ]; then
    mv "$FILE2" "${WD}/terraform/temp"
fi