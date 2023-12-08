"""
Weather module for py3status

By porudev
"""

import requests
import math

icons_list = {
    "01d": "", # Clear sky day.
    "01n": "", # Clear sky night.
    "02d": "", # Few clouds day.
    "02n": "", # Few clouds night.
    "03d": "", # Scattered clouds day.
    "03n": "", # Scattered clouds night.
    "04d": "", # Broken clouds day.
    "04n": "", # Broken clouds night.
    "09d": "", # Shower rain day.
    "09n": "", # Shower rain night.
    "10d": "", # Rain day.
    "10n": "", # Rain night
    "11d": "", # Thunderstorm day.
    "11n": "", # Thunderstorm night
    "13d": "", # Snow day. Snowflake alternative: 
    "13n": "", # Snow night. Snowflake alternative: 
    "50d": "", # Mist day.
    "50n": "", # Mist night.
}


def get_weather() -> str:
    try:
        url = 'https://api.openweathermap.org/data/2.5/weather?units=metric&lat=21.316833&lon=105.8877609&appid=357b20dac2f26244bfd9dcfcc7e3e8c1'
        result = requests.get(url)

        if(result.status_code == requests.codes['ok']):        
                weather = result.json()

                icon = weather['weather'][0]['icon'].capitalize()
                desciption = weather['weather'][0]['description'].capitalize()
                temp = int(math.ceil(float(weather['main']['temp'])))

                return f" {icons_list[icon]} {desciption} {temp}°C "

        else:
            return "  No info "
    except:
        return "  No info "

class Py3status:

    cache_timeout = 300
    format = get_weather()

    def weather(self):
        return {
            'full_text': self.format,
            'cached_until': self.py3.time_in(self.cache_timeout)
        }