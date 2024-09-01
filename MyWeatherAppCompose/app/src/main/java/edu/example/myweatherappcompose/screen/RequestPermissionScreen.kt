package edu.example.myweatherappcompose.screen

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.core.content.ContextCompat
import com.google.accompanist.permissions.ExperimentalPermissionsApi
import com.google.accompanist.permissions.isGranted
import com.google.accompanist.permissions.rememberMultiplePermissionsState
import edu.example.myweatherappcompose.utils.LocationUtils
import edu.example.myweatherappcompose.viewModel.LocationViewModel

@OptIn(ExperimentalPermissionsApi::class)
@Composable
fun RequestPermissionScreen(
    onPermissionGranted: () -> Unit,
    onPermissionDenied: () -> Unit,
) {
    val permissionState = rememberMultiplePermissionsState(
        listOf(
            Manifest.permission.ACCESS_COARSE_LOCATION,
            Manifest.permission.ACCESS_FINE_LOCATION,
        )
    )

    LaunchedEffect(key1 = permissionState) {
        val permissionsToRequest = permissionState.permissions.filter { !it.status.isGranted }

        if (permissionsToRequest.isNotEmpty()) {
            permissionState.launchMultiplePermissionRequest()
        }
    }

    if (permissionState.allPermissionsGranted) {
        onPermissionGranted()
    }

    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(text = permissionState.shouldShowRationale.toString())
    }
}

@Composable
fun RequestingPermission(){

}