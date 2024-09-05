package edu.example.myweatherappcompose.data.states

import androidx.compose.runtime.MutableState
import edu.example.myweatherappcompose.data.GetWeatherResponse
import edu.example.myweatherappcompose.data.LocationData
import java.lang.Exception

sealed class HomePageState {
    data object InitState : HomePageState()
    data object GettingLocationDataState : HomePageState()
    data class FailureState(val exception: Exception) : HomePageState()
    data class RequestingWeatherDataState(val locationData: LocationData) : HomePageState()
    data class ShowingWeatherDataState(
        val weatherData: GetWeatherResponse,
        val address: MutableState<String?>
    ) : HomePageState()
}