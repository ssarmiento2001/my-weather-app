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
) {
    fun toMap(): Map<String, Any> = mapOf(
        "lat" to lat,
        "lon" to lon,
        "appid" to appid,
        "mode" to mode.value,
        "units" to units.value,
        "lang" to lang.value
    )
}
