package edu.example.myweatherappcompose.screen.composables

import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import edu.example.myweatherappcompose.data.GetForecastResponse

@Composable
fun ShowForecast(forecastData: GetForecastResponse) {
    Text(text = "Showing Forecast ${forecastData.list?.size}")
}