package edu.example.myweatherappcompose.screen

import android.os.Build
import androidx.annotation.RequiresApi
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import edu.example.myweatherappcompose.utils.LocationUtils
import edu.example.myweatherappcompose.viewModel.LocationViewModel

@RequiresApi(Build.VERSION_CODES.TIRAMISU)
@Composable
fun HomePage(locationUtils: LocationUtils, viewModel: LocationViewModel) {

    val location = viewModel.location.value
    val address = viewModel.address.value

    if (location == null && locationUtils.hasLocationPermission()) {
        locationUtils.requestLocationUpdates(viewModel = viewModel)
    }

    if (location != null && address == null) {
        locationUtils.reverseGeocodeLocation(locationData = location, viewModel = viewModel)
    }

    Scaffold(
        topBar = {
            AppBar(
                title = "HomePage",
                secondaryButton = {
                    IconButton(onClick = {
                        if(locationUtils.hasLocationPermission()){
                            locationUtils.requestLocationUpdates(viewModel = viewModel)
                            if(location != null){
                                locationUtils.reverseGeocodeLocation(locationData = location, viewModel = viewModel)
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
            if (location != null) {
                Text(text = "Latitude: ${location.latitude} Longitude: ${location.longitude}")
                Text(text = address ?: "Address not found", textAlign = TextAlign.Center)
            } else {
                Text(text = "Location not available")
            }
        }
    }
}