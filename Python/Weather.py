#!/usr/bin/env python3
import requests

CITY = YOUR_CITY
API_KEY = "YOUR_TOKEN"
UNITS = "Metric"
UNIT_KEY = "C"

REQ = requests.get("https://api.openweathermap.org/data/2.5/weather?id={}&appid={}&units={}".format(CITY, API_KEY, UNITS))
try:
    if REQ.status_code == 200:
        CURRENT = REQ.json()["weather"][0]["description"].capitalize()
        TEMP = int(float(REQ.json()["main"]["temp"]))
        HUMIDITY = int(float(REQ.json()["main"]["humidity"]))
        WIND = float(REQ.json()["wind"]["speed"])

        WEATHER = "☁️"
        if CURRENT == "Clear sky":
            WEATHER = "☀️"
        elif CURRENT == "Few clouds" or CURRENT == "Scattered clouds" or CURRENT == "Broken clouds" or CURRENT == "Overcast clouds":
            WEATHER = "☁️"
        elif CURRENT == "Smoke" or CURRENT == "Haze" or CURRENT == "Fog" or CURRENT == "Sand" or CURRENT == "Dust" or CURRENT == "Mist":
            WEATHER = "🌫️"
        elif CURRENT == "Shower sleet" or CURRENT == "Light rain and snow" or CURRENT == "Rain and snow" or CURRENT == "Light shower show" or CURRENT == "Shower snow" or CURRENT == "Heavy shower snow" or CURRENT == "Light shower sleet" or CURRENT == "Sleet" or CURRENT == "Heavy snow" or CURRENT == "Snow" or CURRENT == "Light snow":
            WEATHER = "☃️"
        elif CURRENT == "Light rain" or CURRENT == "Moderate rain" or CURRENT == "Heavy intensity rain" or CURRENT == "Very heavy rain" or CURRENT == "Extreme rain" or CURRENT == "Freezing rain" or CURRENT == "Light intensity shower rain" or CURRENT == "Shower rain" or CURRENT == "Heavy intensity shower rain" or CURRENT == "Ragged shower rain" or CURRENT == "Light intensity drizzle" or CURRENT == "Drizzle" or CURRENT == "Heavy intensity drizzle" or CURRENT == "Light intensity drizzle rain" or CURRENT == "Drizzle rain" or CURRENT == "Heavy intensity drizzle rain" or CURRENT == "Shower rain and drizzle" or CURRENT == "Heavy shower rain and drizzle" or CURRENT == "Shower drizzle" or CURRENT == "Thunderstorm with light rain" or CURRENT == "Thunderstorm with rain" or CURRENT == "Thunderstorm with heavy rain" or CURRENT == "Light thunderstorm" or CURRENT == "Thunderstorm" or CURRENT == "Heavy thunderstorm" or CURRENT == "Ragged thunderstorm" or CURRENT == "Thunderstorm with light drizzle" or CURRENT == "Thunderstorm with drizzle" or CURRENT == "Thunderstorm with heavy drizzle":
            WEATHER = "⛈️"
        print("{}{}°{}, 💨{}m/s, 💧{}%".format(WEATHER, TEMP, UNIT_KEY, WIND, HUMIDITY))
    else:
        print("Error code: " + str(REQ.status_code))
except (ValueError, IOError):
    print("Error")
