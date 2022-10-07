#! /bin/sh

city="Xã+Tân+Hưng" # Your city here
city_cryptic=$(echo $city | sed -e 's/ /_/g')

#condition="$(curl wttr.in/$city_cryptic?format='%c' --silent)"
#temperature="$(curl wttr.in/$city_cryptic?format='%t' --silent)"
#text_condition="$(curl wttr.in/$city_cryptic?format='%C' --silent)"

format="$(curl wttr.in/$city_cryptic?format='%c%t' --silent)"

if [ "$(echo $format | grep 'Unknown')" = "" ];
then 
  #echo "$condition$text_condition | $temperature"
  echo "$format" | sed -e 's/  / /g'
else
  echo "摒 +0°C"
fi
