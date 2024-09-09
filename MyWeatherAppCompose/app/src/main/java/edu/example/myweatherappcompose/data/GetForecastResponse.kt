package edu.example.myweatherappcompose.data

import com.google.gson.annotations.SerializedName

data class GetForecastResponse(
    @SerializedName("cod") val cod: String?,
    @SerializedName("message") val message: String?,
    @SerializedName("cnt") val cnt: Int?,
    @SerializedName("list") val list: List<ForecastList>,
    @SerializedName("city") val city: City?
)
