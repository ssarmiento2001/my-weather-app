package edu.example.myweatherappcompose.data

data class LocationData(
    val latitude: Double,
    val longitude: Double
) {
    companion object {
        fun fromMap(map: Map<String, Double>): LocationData = LocationData(
            latitude = map["latitude"]?.toDouble() ?: 0.0,
            longitude = map["longitude"]?.toDouble() ?: 0.0
        )
    }

    fun toMap(): Map<String, Double> = mapOf(
        "latitude" to latitude,
        "longitude" to longitude
    )
}
