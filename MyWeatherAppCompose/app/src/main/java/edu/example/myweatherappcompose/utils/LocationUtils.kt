package edu.example.myweatherappcompose.utils

import android.Manifest
import android.annotation.SuppressLint
import android.content.Context
import android.content.pm.PackageManager
import android.os.Looper
import androidx.core.content.ContextCompat
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationCallback
import com.google.android.gms.location.LocationRequest
import com.google.android.gms.location.LocationResult
import com.google.android.gms.location.LocationServices
import com.google.android.gms.location.Priority
import com.google.android.gms.tasks.CancellationTokenSource
import edu.example.myweatherappcompose.model.LocationData
import edu.example.myweatherappcompose.viewModel.LocationViewModel

class LocationUtils(private val context: Context) {

    private val _fusedLocationClient: FusedLocationProviderClient =
        LocationServices.getFusedLocationProviderClient(context)

    fun hasLocationPermission(): Boolean {
        return ContextCompat.checkSelfPermission(
            context, Manifest.permission.ACCESS_FINE_LOCATION
        ) == PackageManager.PERMISSION_GRANTED && ContextCompat.checkSelfPermission(
            context, Manifest.permission.ACCESS_COARSE_LOCATION
        ) == PackageManager.PERMISSION_GRANTED
    }

    @SuppressLint("MissingPermission")
    fun getLastUserLocation(
        onSuccess: (LocationData) -> Unit,
        onFailure: (Exception) -> Unit
    ) {
        if (hasLocationPermission()) {
            _fusedLocationClient.lastLocation.addOnSuccessListener { location ->
                location?.let {
                    onSuccess(
                        LocationData(latitude = it.latitude, longitude = it.longitude)
                    )
                }
            }.addOnFailureListener { exception -> onFailure(exception) }
        }
    }

    @SuppressLint("MissingPermission")
    fun getCurrentLocation(
        onSuccess: (LocationData) -> Unit,
        onFailure: (Exception) -> Unit,
        priority: Boolean
    ) {
        val accuracy =
            if (priority) Priority.PRIORITY_HIGH_ACCURACY else Priority.PRIORITY_BALANCED_POWER_ACCURACY

        if (hasLocationPermission()) {
            _fusedLocationClient.getCurrentLocation(accuracy, CancellationTokenSource().token)
                .addOnSuccessListener { location ->
                    location?.let {
                        onSuccess(
                            LocationData(
                                latitude = it.latitude,
                                longitude = it.longitude
                            )
                        )
                    }
                }.addOnFailureListener { exception ->
                    onFailure(exception)
                }
        }
    }

    @SuppressLint("MissingPermission")
    fun requestLocationUpdates(viewModel: LocationViewModel) {
        val locationCallback = object : LocationCallback() {
            override fun onLocationResult(locationResult: LocationResult) {
                super.onLocationResult(locationResult)
                locationResult.lastLocation?.let {
                    val location = LocationData(latitude = it.latitude, longitude = it.longitude)
                    viewModel.updateLocation(location)
                }
            }
        }
        val locationRequest = LocationRequest.Builder(Priority.PRIORITY_HIGH_ACCURACY, 1000).build()

        _fusedLocationClient.requestLocationUpdates(
            locationRequest,
            locationCallback,
            Looper.myLooper()
        )
    }
}