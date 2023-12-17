#!/bin/bash

echo "Test deployment"
terraform plan 

echo "Do you want to process with build? [Y/N]"
read ANSWER

if [ ${ANSWER}x == "Yx" ] || [ ${ANSWER}x == "yx" ]; then 
    terraform apply
fi 

