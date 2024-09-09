package edu.example.myweatherappcompose.viewModel

import android.os.Build
import androidx.compose.runtime.MutableState
import androidx.compose.runtime.State
import androidx.compose.runtime.mutableStateOf
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import edu.example.myweatherappcompose.data.GetWeatherRequest
import edu.example.myweatherappcompose.data.GetWeatherResponse
import edu.example.myweatherappcompose.data.LocationData
import edu.example.myweatherappcompose.data.enums.Lang
import edu.example.myweatherappcompose.data.enums.Mode
import edu.example.myweatherappcompose.data.enums.Units
import edu.example.myweatherappcompose.data.states.HomePageState
import edu.example.myweatherappcompose.utils.Constants
import edu.example.myweatherappcompose.utils.LocationUtils
import kotlinx.coroutines.launch

class HomePageViewModel : ViewModel() {

    private lateinit var _locationUtils: LocationUtils
    private val _apiService = Constants.WeatherAPI.weatherService

    private val _address = mutableStateOf<String?>(null)
    private val _state = mutableStateOf<HomePageState>(HomePageState.InitState)
    val state: State<HomePageState> = _state

    fun init(locationUtils: LocationUtils) {
        if (_state.value is HomePageState.InitState) {
            _locationUtils = locationUtils
            _getLocationData()
        }
    }

    fun getLocationData() {
        when (_state.value) {
            is HomePageState.FailureState -> _getLocationData()
            is HomePageState.ShowingWeatherDataState -> _getLocationData()
            else -> {}
        }
    }

    private fun _getLocationData() {
        _state.value = HomePageState.GettingLocationDataState
        _locationUtils.requestLocationUpdates(this)
    }

    fun updateLocation(newLocation: LocationData) {
        when (_state.value) {
            is HomePageState.GettingLocationDataState -> _requestWeatherData(newLocation)
            else -> {}
        }
    }

    private fun _requestWeatherData(locationData: LocationData) {
        _state.value = HomePageState.RequestingWeatherDataState(locationData = locationData)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            _locationUtils.reverseGeocodeLocation(locationData = locationData, viewModel = this)
        }
        _getWeather(locationData = locationData)
    }

    fun updateAddress(newAddress: String) {
        _address.value = newAddress
    }

    private fun _getWeather(locationData: LocationData) {
        viewModelScope.launch {
            try {
                val response = _apiService.getWeather(
                    getWeatherRequest = GetWeatherRequest(
                        lat = locationData.latitude,
                        lon = locationData.longitude,
                        appid = Constants.WeatherAPI.appid,
                        mode = Mode.JSON,
                        units = Units.METRIC,
                        lang = Lang.ENGLISH
                    ).toMap()
                )
                _state.value = HomePageState.ShowingWeatherDataState(
                    weatherData = response,
                    address = _address,
                    locationData = locationData
                )
            } catch (e: Exception) {
                _state.value = HomePageState.FailureState(exception = e)
            }
        }
    }
}