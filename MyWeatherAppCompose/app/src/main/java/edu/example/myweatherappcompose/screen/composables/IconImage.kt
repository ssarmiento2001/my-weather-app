package edu.example.myweatherappcompose.screen.composables

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.size
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.Dp
import edu.example.myweatherappcompose.data.enums.WeatherIcon
import edu.example.myweatherappcompose.utils.Constants

@Composable
fun IconImage(path: String, size: Dp, description: String? = null) {
    val icon: WeatherIcon = Constants.getWeatherIcon(path)
    Image(
        modifier = Modifier.size(size),
        painter = painterResource(id = icon.value),
        contentDescription = description
    )
}