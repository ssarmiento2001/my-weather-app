package edu.example.myweatherappcompose.data.enums

enum class Lang(val value: String) {
    ENGLISH("en"),
    ESPANOL("es");

    override fun toString(): String {
        return value
    }
}