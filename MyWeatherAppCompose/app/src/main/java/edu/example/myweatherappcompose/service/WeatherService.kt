package edu.example.myweatherappcompose.service

import edu.example.myweatherappcompose.data.GetWeatherResponse
import retrofit2.http.GET
import retrofit2.http.Query

interface WeatherService {
    @GET("weather")
    suspend fun getWeather(
        @Query("lat") lat: Double,
        @Query("lon") lon: Double,
        @Query("appid") appid: String,
        @Query("mode") mode: String,
        @Query("units") units: String,
        @Query("lang") lang: String
    ): GetWeatherResponse
}