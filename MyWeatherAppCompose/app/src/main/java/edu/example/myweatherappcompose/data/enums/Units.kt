package edu.example.myweatherappcompose.data.enums

enum class Units(val value: String) {
    STANDARD("standard"),
    METRIC("metric"),
    IMPERIAL("imperial");

    override fun toString(): String {
        return value
    }
}