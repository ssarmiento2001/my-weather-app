package edu.example.myweatherappcompose.screen

import android.os.Build
import androidx.annotation.RequiresApi
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import edu.example.myweatherappcompose.data.GetWeatherRequest
import edu.example.myweatherappcompose.data.GetWeatherResponse
import edu.example.myweatherappcompose.data.Result
import edu.example.myweatherappcompose.data.enums.Lang
import edu.example.myweatherappcompose.data.enums.Mode
import edu.example.myweatherappcompose.data.enums.Units
import edu.example.myweatherappcompose.screen.composables.ErrorView
import edu.example.myweatherappcompose.screen.composables.LoadingView
import edu.example.myweatherappcompose.screen.composables.ShowWeather
import edu.example.myweatherappcompose.utils.Constants
import edu.example.myweatherappcompose.utils.LocationUtils
import edu.example.myweatherappcompose.viewModel.LocationViewModel

@RequiresApi(Build.VERSION_CODES.TIRAMISU)
@Composable
fun HomePage(locationUtils: LocationUtils, viewModel: LocationViewModel) {

    val location = viewModel.location.value
    val address = viewModel.address.value
    val weather = viewModel.weather.value

    if (location == null && locationUtils.hasLocationPermission()) {
        locationUtils.requestLocationUpdates(viewModel = viewModel)
    }

    if (location != null && address == null) {
        locationUtils.reverseGeocodeLocation(locationData = location, viewModel = viewModel)
    }

    if (location != null && address != null) {
        val request = GetWeatherRequest(
            appid = Constants.WeatherAPI.appid,
            lat = location.latitude,
            lon = location.longitude,
            mode = Mode.JSON,
            units = Units.METRIC,
            lang = Lang.ENGLISH
        )
        viewModel.getWeather(request = request)
    }

    Scaffold(
        topBar = {
            AppBar(
                title = "HomePage",
                secondaryButton = {
                    IconButton(onClick = {
                        viewModel.resetState()
                        if (locationUtils.hasLocationPermission()) {
                            locationUtils.requestLocationUpdates(viewModel = viewModel)
                            if (location != null) {
                                locationUtils.reverseGeocodeLocation(
                                    locationData = location,
                                    viewModel = viewModel
                                )
                            }
                        }
                    }) {
                        Icon(
                            imageVector = Icons.Default.Refresh,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.onPrimary
                        )
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            if (weather != null) {
                if (weather is Result.Success) {
                    ShowWeather(address = address ?: "Address", weatherData = weather.data)
                } else {
                    ErrorView(
                        title = "API call failure",
                        description = (weather as Result.Error).exception.message ?: ""
                    )
                }
            } else {
                LoadingView()
            }
        }
    }
}

@Composable
fun GetWeather(result: Result<GetWeatherResponse>) {
    Text(text = if (result is Result.Success) "success" else "error: ${(result as Result.Error).exception.message}")
}