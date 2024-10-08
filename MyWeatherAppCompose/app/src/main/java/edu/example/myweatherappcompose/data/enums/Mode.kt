package edu.example.myweatherappcompose.data.enums

enum class Mode(val value: String) {
    JSON("json"),
    XML("xml"),
    HTML("html");

    override fun toString(): String {
        return value
    }
}