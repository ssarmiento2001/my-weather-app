package edu.example.myweatherappcompose.data

import edu.example.myweatherappcompose.data.enums.Lang
import edu.example.myweatherappcompose.data.enums.Mode
import edu.example.myweatherappcompose.data.enums.Units

data class GetWeatherRequest(
    val lat: Double,
    val lon: Double,
    val appid: String,
    val mode: Mode,
    val units: Units,
    val lang: Lang
)
