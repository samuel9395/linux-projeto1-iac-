#!/bin/bash

echo "Criando diretórios..."
echo

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec
 
echo 
echo "Criando grupos de usuários..."
echo

groupadd GRP_ADM 
groupadd GRP_VEN 
groupadd GRP_SEC 
 
echo
echo "Criando diretórios..."
echo

# o parâmetro -6 gera o hash SHA-512 moderno e seguro

useradd joaquin -m -s /bin/bash -c "joaquin Sanchez"  -p $(openssl passwd -6 Senha123) -G GRP_ADM  
useradd basilio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
 
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN 
useradd jose -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd manoel -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
 
useradd jorge -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC 
useradd bob -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd joana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

echo 
echo "Especificando permissões dos diretórios..."
echo

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo
echo "Fim....."
