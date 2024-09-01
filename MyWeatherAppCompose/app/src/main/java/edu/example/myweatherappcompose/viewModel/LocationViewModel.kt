package edu.example.myweatherappcompose.viewModel

import androidx.compose.runtime.State
import androidx.compose.runtime.mutableStateOf
import androidx.lifecycle.ViewModel
import edu.example.myweatherappcompose.data.LocationData

class LocationViewModel : ViewModel() {
    private val _location = mutableStateOf<LocationData?>(null)
    val location: State<LocationData?> = _location
    private val _address = mutableStateOf<String?>(null)
    val address: State<String?> = _address

    fun updateLocation(newLocation: LocationData) {
        _location.value = newLocation
    }

    fun updateAddress(newAddress : String){
        _address.value = newAddress
    }
}