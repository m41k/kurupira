#!/bin/bash

#By github.com/m41k

cat << EOF > termos
tcp,r
Engenharia Social,o
Windows,o
Linux,o
VPS,r
Kurupira,o
DDOS,r
Python,p
Java,p
EOF

cat termos | sort > saida

#cat saida | sed "s/Linux/$(printf "\033[33;1mLinux\033[m")/g"
#cat saida | sed "s/$TEXTO/$(printf "\033[31;1m$TEXTO\033[m")/g"

#cat saida

cor(){

cat saida | while read LINHA; do
TEXTO=`echo $LINHA | cut -d "," -f1`
TIPO=`echo $LINHA | cut -d "," -f2`

case $TIPO in
	r)
         echo -e "\033[34;1m$TEXTO\033[m"
#	 echo $TEXTO "rede"
	;;
	p)
	  echo -e "\033[31;1m$TEXTO\033[m"
#	 echo $TEXTO "programacao"
	;;
	*)
	  echo -e "\033[37;1m$TEXTO\033[m"
#	 echo $TEXTO "outros"

	;;
esac
#echo "$LINHA" $TIPO
#sed "s/Linux/$(printf "\033[31;1mLinux\033[m")/g" | \
#sed "s/Windows/$(printf "\033[34;1mWindows\033[m")/g" \
done
}
cor | column
