package edu.example.myweatherappcompose.utils

import edu.example.myweatherappcompose.data.enums.WeatherIcon
import edu.example.myweatherappcompose.service.WeatherService
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object Constants {
    object WeatherAPI {
        private val retrofit: Retrofit by lazy {
            Retrofit.Builder().baseUrl("https://api.openweathermap.org/data/2.5/")
                .addConverterFactory(GsonConverterFactory.create()).build()
        }
        val weatherService: WeatherService = retrofit.create(WeatherService::class.java)
        val appid: String = "db58f9b80807a12f6afb87b9f373036b"
    }

    fun getWeatherIcon(path: String): WeatherIcon {
        return when (path) {
            "01d" -> WeatherIcon.CLEAR_SKY_DAY
            "01n" -> WeatherIcon.CLEAR_SKY_NIGHT
            "02d" -> WeatherIcon.FEW_CLOUDS_DAY
            "02n" -> WeatherIcon.FEW_CLOUDS_NIGHT
            "03d" -> WeatherIcon.SCATTERED_CLOUDS
            "03n" -> WeatherIcon.SCATTERED_CLOUDS
            "04d" -> WeatherIcon.BROKEN_CLOUDS
            "04n" -> WeatherIcon.BROKEN_CLOUDS
            "09d" -> WeatherIcon.SHOWER_RAIN
            "09n" -> WeatherIcon.SHOWER_RAIN
            "10d" -> WeatherIcon.RAIN_DAY
            "10n" -> WeatherIcon.RAIN_NIGHT
            "11d" -> WeatherIcon.THUNDERSTORM
            "11n" -> WeatherIcon.THUNDERSTORM
            "13d" -> WeatherIcon.SNOW
            "13n" -> WeatherIcon.SNOW
            "50d" -> WeatherIcon.HAZE
            "50n" -> WeatherIcon.HAZE
            else -> WeatherIcon.DEFAULT
        }
    }
}