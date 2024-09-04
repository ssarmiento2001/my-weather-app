package edu.example.myweatherappcompose.screen.composables

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import edu.example.myweatherappcompose.data.GetWeatherResponse

@Composable
fun ShowWeather(address: String, weatherData: GetWeatherResponse) {
    val textColor = MaterialTheme.colorScheme.onPrimary
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(color = MaterialTheme.colorScheme.primary),
        verticalArrangement = Arrangement.SpaceEvenly,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = address,
            textAlign = TextAlign.Center,
            style = TextStyle(fontWeight = FontWeight.Bold),
            color = textColor
        )
        Text(
            text = weatherData.weather?.firstOrNull()?.description ?: "No description",
            color = textColor,
        )
        Text(text = weatherData.main?.temp.toString(), color = textColor)
        Text(text = weatherData.main?.temp_max.toString(), color = textColor)
        Text(text = weatherData.main?.temp_min.toString(), color = textColor)
        Text(text = weatherData.main?.feels_like.toString(), color = textColor)
        Text(text = weatherData.main?.humidity.toString(), color = textColor)
    }
}