package edu.example.myweatherappcompose.utils

import edu.example.myweatherappcompose.service.WeatherService
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object Constants {
    object WeatherAPI {
        private val retrofit : Retrofit by lazy {
            Retrofit.Builder().baseUrl("https://api.openweathermap.org/data/2.5/")
                .addConverterFactory(GsonConverterFactory.create()).build()
        }
        val weatherService: WeatherService = retrofit.create(WeatherService::class.java)
        val appid : String = "db58f9b80807a12f6afb87b9f373036b"
    }
}