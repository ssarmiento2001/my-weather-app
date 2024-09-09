package edu.example.myweatherappcompose.screen

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import edu.example.myweatherappcompose.R
import edu.example.myweatherappcompose.data.LocationData
import edu.example.myweatherappcompose.data.states.ForecastState
import edu.example.myweatherappcompose.screen.composables.ErrorView
import edu.example.myweatherappcompose.screen.composables.LoadingView
import edu.example.myweatherappcompose.screen.composables.ShowForecast
import edu.example.myweatherappcompose.viewModel.ForecastViewModel

@Composable
fun ForecastScreen(
    forecastViewModel: ForecastViewModel,
    locationData: LocationData,
    onBackButtonPressed: () -> Unit
) {
    val state = forecastViewModel.state
    if (state.value is ForecastState.RequestingForecastData) {
        forecastViewModel.requestForecast(locationData)
    }

    Scaffold(
        topBar = {
            AppBar(
                title = stringResource(id = R.string.forecast_page_title),
                onBackNavClicked = onBackButtonPressed
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
                ForecastState.RequestingForecastData -> LoadingView(message = stringResource(id = R.string.requesting_forecast_data))
                is ForecastState.FailureState -> ErrorView(
                    title = stringResource(id = R.string.forecast_error),
                    description = (state.value as ForecastState.FailureState).exception.message
                        ?: stringResource(
                            id = R.string.default_error_message
                        )
                )
                is ForecastState.ShowingForecastData -> ShowForecast(forecastData = (state.value as ForecastState.ShowingForecastData).forecastData)
            }
        }
    }
}