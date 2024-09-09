package edu.example.myweatherappcompose.data

import edu.example.myweatherappcompose.data.enums.Lang
import edu.example.myweatherappcompose.data.enums.Mode
import edu.example.myweatherappcompose.data.enums.Units

data class GetForecastRequest(
    val lat: Double,
    val lon: Double,
    val appid: String,
    val units: Units,
    val mode: Mode,
    val cnt: Int,
    val lang: Lang
) {
    fun toMap(): Map<String, Any> = mapOf(
        "lat" to lat,
        "lon" to lon,
        "appid" to appid,
        "units" to units.value,
        "mode" to mode.value,
        "cnt" to cnt,
        "lang" to lang.value
    )
}
