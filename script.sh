#! /bin/bash

echo "###########################"
echo "**** Criando as imagens ***"
echo "###########################"

docker build -t elderyde/projeto-backend:1.0 backend/.
docker build -t elderyde/projeto-database:1.0 database/.

echo ""

echo "####################################"
echo "**** Realizando push das imagens ***"
echo "####################################"

docker push elderyde/projeto-backend:1.0
docker push elderyde/projeto-database:1.0	

echo ""
echo "##############################################"
echo "**** Criando Serviço no cluster Kurbenetes ***"
echo "##############################################"

kubectl apply -f ./services.yml

echo ""
echo "###############################"
echo "**** Criando os deployments ***"
echo "###############################"

kubectl apply -f ./deployment.yml
