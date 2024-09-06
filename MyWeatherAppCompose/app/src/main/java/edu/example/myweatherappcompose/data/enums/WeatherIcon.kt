package edu.example.myweatherappcompose.data.enums

import edu.example.myweatherappcompose.R

enum class WeatherIcon(val value: Int) {
    DEFAULT(R.drawable.icon),
    CLEAR_SKY_DAY(R.drawable.clear_sky_day),
    CLEAR_SKY_NIGHT(R.drawable.clear_sky_night),
    FEW_CLOUDS_DAY(R.drawable.few_clouds_day),
    FEW_CLOUDS_NIGHT(R.drawable.few_clouds_night),
    SCATTERED_CLOUDS(R.drawable.scattered_clouds),
    BROKEN_CLOUDS(R.drawable.broken_clouds),
    SHOWER_RAIN(R.drawable.shower_rain),
    RAIN_DAY(R.drawable.rain_day),
    RAIN_NIGHT(R.drawable.rain_night),
    THUNDERSTORM(R.drawable.thunderstorm),
    SNOW(R.drawable.thunderstorm),
    HAZE(R.drawable.haze)

}