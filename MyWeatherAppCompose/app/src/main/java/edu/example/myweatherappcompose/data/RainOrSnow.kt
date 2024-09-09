package edu.example.myweatherappcompose.data

import com.google.gson.annotations.SerializedName

data class RainOrSnow(
    @SerializedName("1h") val oneH: Double?,
    @SerializedName("3h") val threeH: Double?
)
