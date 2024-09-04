package edu.example.myweatherappcompose.data

data class GetWeatherResponse(
    val coord: Coord?,
    val weather: List<Weather>?,
    val base: String?,
    val main: Main?,
    val visibility: Int?,
    val wind: Wind?,
    val clouds: Clouds?,
    val dt: Int?,
    val sys: Sys?,
    val timezone: Int?,
    val id: Int?,
    val name: String?,
    val cod: Int?,
    val rain: RainOrSnow?,
    val snow: RainOrSnow?
)
