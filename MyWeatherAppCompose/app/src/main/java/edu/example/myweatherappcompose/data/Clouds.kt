package edu.example.myweatherappcompose.data

import com.google.gson.annotations.SerializedName

data class Clouds(
    @SerializedName("all") val all: Int?
)
