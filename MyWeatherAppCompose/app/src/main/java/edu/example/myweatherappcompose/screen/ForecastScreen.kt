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
import edu.example.myweatherappcompose.viewModel.ForecastViewModel

@Composable
fun ForecastScreen(
    forecastViewModel: ForecastViewModel,
    locationData: LocationData
) {
    Scaffold(
        topBar = {
            AppBar(title = stringResource(id = R.string.forecast_page_title))
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Text(text = "Lat: ${locationData.latitude} Lon: ${locationData.longitude}")
        }
    }
}