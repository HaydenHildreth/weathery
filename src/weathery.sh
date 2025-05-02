#!/bin/bash

#CONFIG
api_key="change me" # OpenWeather API key
city="change me" # City name for API call
units="imperial" # metric or imperial
show_city=false # Show city (true/false)
show_date=false # Show date (true/false)

# API Calls
temp=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=89cf93e5718306aec01e90693010aade&units=$units" | jq '.main | (.temp)')
weather=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=89cf93e5718306aec01e90693010aade&units=$units" | jq -r '.weather[] | (.main)')
wind=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=89cf93e5718306aec01e90693010aade&units=$units" | jq -r '.wind | (.speed)')
sunriseepoch=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=89cf93e5718306aec01e90693010aade&units=$units" | jq -r '.sys | (.sunrise)')
sunsetepoch=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=89cf93e5718306aec01e90693010aade&units=$units"| jq -r '.sys | (.sunset)')

# Convert epoch time to readable format
sunrise=$( date -d @$sunriseepoch +"%H:%M:%S" )
sunset=$( date -d @$sunsetepoch +"%H:%M:%S" )

# Set units of measure based on units variable setting
if [[ $units = "imperial" ]]; then
wind_unit="mph"
temp_unit="°F"
elif [[ $units = "metric" ]]; then
wind_unit="m/s"
temp_unit="°C"
else
wind_unit=""
temp_unit=""
fi

if [[ $weather = "Rain" ]]; then
    if [ $show_city = true ]; then 
    echo "                 City: $city"
    fi
echo "                 Weather: rainy"
echo "       .--.      Temperature: $temp $temp_unit"
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
echo "    .-(    ).    Temperature: $temp $temp_unit"
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
echo "      .-.      Temperature: $temp $temp_unit"
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
echo "       .--.      Temperature: $temp $temp_unit"
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
echo "    .-(    ).    Temperature: $temp $temp_unit"
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
echo "       .--.      Temperature: $temp $temp_unit"
echo "    .-(    ).    Wind speed: $wind $wind_unit"
echo "   (___.__)__)   Sunrise: $sunrise"
echo "                 Sunset: $sunset"
    if [ $show_date = true ]; then 
    echo "                 Date: $current_date" 
    fi
fi
