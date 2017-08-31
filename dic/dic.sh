#!/bin/bash

#By github.com/m41k

END="https://raw.githubusercontent.com/m41k/kurupira/master/dic/"

if [ ! -e dic.conf ]; then
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

fi

cat termos | sort > saida

cor(){

cat saida | while read LINHA; do
TEXTO=`echo $LINHA | cut -d "," -f1`
TIPO=`echo $LINHA | cut -d "," -f2`

case $TIPO in
	r)
         echo -e "\033[34;1m$TEXTO\033[m"
	;;
	p)
	  echo -e "\033[31;1m$TEXTO\033[m"
	;;
	*)
	  echo -e "\033[37;1m$TEXTO\033[m"
	;;
esac
done
}

case $1 in
	-update)
	 A=`wc -l termos | cut -d " " -f1`
	 wget $END/index -qO termos
	 B=`wc -l termos | cut -d " " -f1`
	 echo 1 > dic.conf
	 echo "Atualizados $(expr $B - $A) termos"
	;;
	-reset)
	rm termos dic.conf &> /dev/null
	;;
	*)
	 cor | column
	;;
esac

