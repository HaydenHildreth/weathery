#!/bin/bash

api_key="change me" # OpenWeather API key
city="change me" # City name for API call
units="imperial" # metric or imperial
show_city=false # Show city (true/false)
show_date=false # Show date (true/false)
current_date=$(date +%d-%m-%Y) # Current system date
current_time=$(date +%H:%M:%S) # Current system time

temp=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=89cf93e5718306aec01e90693010aade&units=$units" | jq '.main | (.temp)')
weather=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=89cf93e5718306aec01e90693010aade&units=$units" | jq -r '.weather[] | (.main)')
wind=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=89cf93e5718306aec01e90693010aade&units=$units" | jq -r '.wind | (.speed)')
sunriseepoch=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=89cf93e5718306aec01e90693010aade&units=$units" | jq -r '.sys | (.sunrise)')
sunsetepoch=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=89cf93e5718306aec01e90693010aade&units=$units"| jq -r '.sys | (.sunset)')

sunrise=$( date -d @$sunriseepoch +"%H:%M:%S" )
sunset=$( date -d @$sunsetepoch +"%H:%M:%S" )
if [[ $units = "imperial" ]]; then
wind_unit="mph"
elif [[ $units = "metric" ]]; then
wind_unit="kph"
else
wind_unit=""
fi

if [[ $weather = "Rain" ]]; then
    if [ $show_city = true ]; then 
    echo "                 City: $city"
    fi
echo "                 Weather: rainy"
echo "       .--.      Temperature: $temp"
echo "    .-(    ).    Wind speed: $wind $wind_unit"
echo "   (___.__)__)   Sunrise: $sunrise"
echo "    ʻ‚ʻ‚ʻ‚ʻ‚ʻ    Sunset: $sunset"
    if [ $show_date = true ]; then 
    echo "                 Date: $current_date" 
    fi
elif [[ $weather = "Clouds" ]]; then
    if [ $show_city = true ]; then 
    echo "                 City: $city"
    fi
echo "       .--.      Weather: cloudy"
echo "    .-(    ).    Temperature: $temp"
echo "   (___.__)__)   Wind speed: $wind $wind_unit"
echo "                 Sunrise: $sunrise"
echo "                 Sunset: $sunset"
    if [ $show_date = true ]; then 
    echo "                 Date: $current_date" 
    fi
elif [[ $weather = "Clear" ]]; then
    if [ $show_city = true ]; then 
    echo "               City: $city"
    fi
echo "     \   /     Weather: clear"
echo "      .-.      Temperature: $temp"
echo "   ‒ (   ) ‒   Wind speed: $wind $wind_unit"
echo "      \`-᾿      Sunrise: $sunrise"
echo "     /   \     Sunset: $sunset"
    if [ $show_date = true ]; then 
    echo "                 Date: $current_date" 
    fi
elif [[ $weather = "Snow" ]]; then
    if [ $show_city = true ]; then 
    echo "                 City: $city"
    fi
echo "                 Weather: snowy"
echo "       .--.      Temperature: $temp"
echo "    .-(    ).    Wind speed: $wind $wind_unit"
echo "   (___.__)__)   Sunrise: $sunrise"
echo "    * * * * *    Sunset: $sunset"
    if [ $show_date = true ]; then 
    echo "                 Date: $current_date" 
    fi
elif [[ $weather = "Thunderstorm" ]]; then
    if [ $show_city = true ]; then 
    echo "                 City: $city"
    fi
echo "       .--.      Weather: stormy"
echo "    .-(    ).    Temperature: $temp"
echo "   (___.__)__)   Wind speed: $wind $wind_unit"
echo "        /_       Sunrise: $sunset"
echo "         /       Sunset: $sunrise"
    if [ $show_date = true ]; then 
    echo "                 Date: $current_date" 
    fi
else
    if [ $show_city = true ]; then 
    echo "                 City: $city"
    fi
echo "                 Weather: $weather"
echo "       .--.      Temperature: $temp"
echo "    .-(    ).    Wind speed: $wind $wind_unit"
echo "   (___.__)__)   Sunrise: $sunrise"
echo "                 Sunset: $sunset"
    if [ $show_date = true ]; then 
    echo "                 Date: $current_date" 
    fi
fi
