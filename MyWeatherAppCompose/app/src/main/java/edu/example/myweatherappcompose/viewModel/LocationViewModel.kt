package edu.example.myweatherappcompose.viewModel

import androidx.compose.runtime.MutableState
import androidx.compose.runtime.State
import androidx.compose.runtime.mutableStateOf
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import edu.example.myweatherappcompose.data.GetWeatherRequest
import edu.example.myweatherappcompose.data.GetWeatherResponse
import edu.example.myweatherappcompose.data.LocationData
import edu.example.myweatherappcompose.data.Result
import edu.example.myweatherappcompose.utils.Constants
import kotlinx.coroutines.launch

class LocationViewModel : ViewModel() {
    private val _location = mutableStateOf<LocationData?>(null)
    val location: State<LocationData?> = _location
    private val _address = mutableStateOf<String?>(null)
    val address: State<String?> = _address

    private val apiService = Constants.WeatherAPI.weatherService
    private val _weather: MutableState<Result<GetWeatherResponse>?> = mutableStateOf(null)
    val weather: State<Result<GetWeatherResponse>?> = _weather

    fun updateLocation(newLocation: LocationData) {
        _location.value = newLocation
    }

    fun updateAddress(newAddress: String) {
        _address.value = newAddress
    }

    fun getWeather(request: GetWeatherRequest) {
        viewModelScope.launch {
            try {
                val response = apiService.getWeather(
                    lat = request.lat,
                    lon = request.lon,
                    appid = request.appid,
                    mode = request.mode.value,
                    units = request.units.value,
                    lang = request.lang.value
                )
                _weather.value = Result.Success(response)
            } catch (e: Exception) {
                _weather.value = Result.Error(e)
            }
        }
    }

    fun resetState(){
        _location.value = null
        _address.value = null
        _weather.value = null
    }
}