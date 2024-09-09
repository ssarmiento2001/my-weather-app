package edu.example.myweatherappcompose.data.states

import edu.example.myweatherappcompose.data.GetForecastResponse
import java.lang.Exception

sealed class ForecastState {
    data object RequestingForecastData : ForecastState()
    data class FailureState(val exception: Exception) : ForecastState()
    data class ShowingForecastData(val forecastData: GetForecastResponse) : ForecastState()
}