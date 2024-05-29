#!/bin/bash
clear
echo ""
fecha=$(date "+%A, %B-%d, %Y")
echo $fecha
echo ""
echo ""

nuevo(){
gsutil mb -p sit-devops-training -c standard -l us -b on gs://sit-devops-training-bkt$num
gsutil label ch -l KEY_1:Grupo:Grupo-02 gs://sit-devops-training-bkt$num
gsutil label ch -l KEY_2:Proyecto:golondrinas gs://sit-devops-training-bkt$num
gcloud storage buckets describe gs://sit-devops-training-bkt$num --format= "default(uniform_access)"
} 

crearc(){
    funcion=$(gs://sit-devops-training-bkt$num)
    for j in $(seq -w 1 100); 
    do
     gsutil cp /dev/null gs://${funcion}/carpeta-${j}/
     touch sinceramente.txt
    done
}

validacion(){
echo ""
crearc
#gsutil ls | grep "sit-devops-training-bkt"
#        listado=$(gsutil ls | grep "sit-devops-training-bkt$num")
#if [ "gs://sit-devops-training-bkt$num/" = $listado ]; then
#if [ -n "$listado" ]; then
#echo ""
#echo ""
# echo "¡¡ El bucket YA EXISTE $listado !!, elige otro"
    #            echo ""
               # eliminar
   #     else
                #nuevo
  #              echo "Se crea bucket"
 #               fi
}


eliminar() {
        opcelim=""
 echo ""
 echo "¿ Deseas eliminar el bucket ?"
                echo ""
                echo "1.- Si  2.- No"
                echo ""
                read -n 1 opcelim
                echo ""
                if [ -z $opcelim ]; then 
                        echo "Debe de contener un valor"
                        read
                        eliminar
                else
                if [ $opcelim -eq 1 ]; then
                        echo ""
                        echo "Se elimino el Bucket"
                        # gsutil -m rm -r gs://sit-devops-training-bkt$num/*
                        # gsutil rb gs://sit-devops-training-bkt$num
                elif [ $opcelim -eq 2 ]; then
                        echo ""
                        exit -1
                else
                        echo ""
                        echo "No es opcion valida, vuelve intentarlo"
                        read
                        eliminar
                fi
                fi
}

echo ""
date

echo ""
echo ""
echo "¿ Cual es numero del Bucket a crear a 2 digitos: " '\c'
read -n 2 num


validacion
