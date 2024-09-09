package edu.example.myweatherappcompose.viewModel

import androidx.compose.runtime.State
import androidx.compose.runtime.mutableStateOf
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import edu.example.myweatherappcompose.data.GetForecastRequest
import edu.example.myweatherappcompose.data.LocationData
import edu.example.myweatherappcompose.data.enums.Lang
import edu.example.myweatherappcompose.data.enums.Mode
import edu.example.myweatherappcompose.data.enums.Units
import edu.example.myweatherappcompose.data.states.ForecastState
import edu.example.myweatherappcompose.utils.Constants
import kotlinx.coroutines.launch

class ForecastViewModel : ViewModel() {

    private val _apiService = Constants.WeatherAPI.weatherService

    private val _state = mutableStateOf<ForecastState>(ForecastState.InitState)
    val state: State<ForecastState> = _state

    fun requestForecast(locationData: LocationData) {
        when(_state.value){
            ForecastState.InitState -> _requestForecast(locationData)
            else -> {}
        }
    }

    fun resetState() {
        _state.value = ForecastState.InitState
    }

    private fun _requestForecast(locationData: LocationData) {
        _state.value = ForecastState.RequestingForecastData
        viewModelScope.launch {
            try {
                val response = _apiService.getForecast(
                    getForecastRequest = GetForecastRequest(
                        lat = locationData.latitude,
                        lon = locationData.longitude,
                        cnt = 24,
                        lang = Lang.ENGLISH,
                        units = Units.METRIC,
                        mode = Mode.JSON,
                        appid = Constants.WeatherAPI.appid
                    ).toMap()
                )
                _state.value = ForecastState.ShowingForecastData(response)
            } catch (e: Exception) {
                _state.value = ForecastState.FailureState(exception = e)
            }
        }
    }

}