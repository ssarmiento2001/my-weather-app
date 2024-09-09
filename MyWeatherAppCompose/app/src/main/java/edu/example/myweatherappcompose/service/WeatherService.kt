package edu.example.myweatherappcompose.service

import edu.example.myweatherappcompose.data.GetForecastResponse
import edu.example.myweatherappcompose.data.GetWeatherResponse
import retrofit2.http.GET
import retrofit2.http.QueryMap

interface WeatherService {
    @GET("weather")
    @JvmSuppressWildcards
    suspend fun getWeather(
        @QueryMap getWeatherRequest: Map<String, Any>
    ): GetWeatherResponse

    @GET("forecast")
    @JvmSuppressWildcards
    suspend fun getForecast(
        @QueryMap getForecastRequest: Map<String, Any>
    ): GetForecastResponse
}