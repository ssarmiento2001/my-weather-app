package edu.example.myweatherappcompose.screen

import androidx.activity.compose.BackHandler
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
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import edu.example.myweatherappcompose.R
import edu.example.myweatherappcompose.data.LocationData
import edu.example.myweatherappcompose.data.states.HomePageState
import edu.example.myweatherappcompose.screen.composables.AppBar
import edu.example.myweatherappcompose.screen.composables.ErrorView
import edu.example.myweatherappcompose.screen.composables.LoadingView
import edu.example.myweatherappcompose.screen.composables.ShowWeather
import edu.example.myweatherappcompose.utils.LocationUtils
import edu.example.myweatherappcompose.viewModel.HomePageViewModel

@Composable
fun HomePage(
    locationUtils: LocationUtils,
    viewModel: HomePageViewModel,
    onRequestForecast: (LocationData) -> Unit
) {

    val state = viewModel.state

    if (state.value is HomePageState.InitState) {
        viewModel.init(locationUtils = locationUtils)
    }

    Scaffold(
        topBar = {
            AppBar(
                title = stringResource(id = R.string.home_page_title),
                secondaryButton = {
                    IconButton(onClick = {
                        viewModel.getLocationData()
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
            when (state.value) {
                HomePageState.InitState -> LoadingView(message = "")
                is HomePageState.FailureState -> ErrorView(
                    title = stringResource(id = R.string.home_page_error),
                    description = (state.value as HomePageState.FailureState).exception.message
                        ?: stringResource(id = R.string.default_error_message)
                )

                HomePageState.GettingLocationDataState -> LoadingView(
                    message = stringResource(id = R.string.getting_location_data)
                )

                is HomePageState.RequestingWeatherDataState -> LoadingView(
                    message = stringResource(
                        id = R.string.requesting_current_weather
                    )
                )

                is HomePageState.ShowingWeatherDataState -> ShowWeather(
                    address = (state.value as HomePageState.ShowingWeatherDataState).address,
                    weatherData = (state.value as HomePageState.ShowingWeatherDataState).weatherData,
                    onButtonPressed = { onRequestForecast((state.value as HomePageState.ShowingWeatherDataState).locationData) }
                )
            }
        }
    }
    BackHandler {}
}