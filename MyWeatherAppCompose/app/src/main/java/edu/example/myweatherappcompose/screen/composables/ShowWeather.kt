package edu.example.myweatherappcompose.screen.composables

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.width
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.MutableState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import edu.example.myweatherappcompose.data.GetWeatherResponse

@Composable
fun ShowWeather(address: MutableState<String?>, weatherData: GetWeatherResponse) {
    val textColor = MaterialTheme.colorScheme.onPrimary
    val description = weatherData.weather?.firstOrNull()?.description ?: "No description"
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(color = MaterialTheme.colorScheme.primary),
        verticalArrangement = Arrangement.SpaceEvenly,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            modifier = Modifier.width(150.dp),
            text = address.value ?: "No address",
            textAlign = TextAlign.Center,
            style = TextStyle(fontWeight = FontWeight.Bold),
            color = textColor,
            maxLines = 2,
            overflow = TextOverflow.Ellipsis
        )
        IconImage(
            path = weatherData.weather?.firstOrNull()?.icon ?: "",
            size = 200.dp,
            description = description
        )
        Text(
            text = description,
            color = textColor,
        )
        Text(text = weatherData.main?.temp.toString(), color = textColor)
        Text(text = weatherData.main?.temp_max.toString(), color = textColor)
        Text(text = weatherData.main?.temp_min.toString(), color = textColor)
        Text(text = weatherData.main?.feels_like.toString(), color = textColor)
        Text(text = weatherData.main?.humidity.toString(), color = textColor)
    }
}