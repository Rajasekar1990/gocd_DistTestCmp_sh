#!/usr/bin/env bash

echo "## Login to ACR ##"
LoginStatus=$(docker login jmeteracrrepo.azurecr.io -u ${ACRusername} -p ${ACRpwd} | grep "Succeeded" | wc -l)
#LoginStatus=$(docker login jmeteracrrepo.azurecr.io -u $ACRusername -p $ACRpwd | grep "Succeeded" | wc -l)

echo "## LoginStatus:$LoginStatus ##"

if [ $LoginStatus != 0 ] 
then
echo "## ACR Login Succeeded ##"
else
echo "## ACR Login Failed ##"
fi