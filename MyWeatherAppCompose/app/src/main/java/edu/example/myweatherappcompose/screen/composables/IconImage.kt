package edu.example.myweatherappcompose.screen.composables

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.size
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.sp
import edu.example.myweatherappcompose.data.enums.WeatherIcon
import edu.example.myweatherappcompose.utils.Constants

@Composable
fun IconImage(path: String, size: Dp, description: String? = null) {
    val icon: WeatherIcon = Constants.getWeatherIcon(path)
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Image(
            modifier = Modifier.size(size),
            painter = painterResource(id = icon.value),
            contentDescription = description
        )
        if (description != null) Text(
            text = description.uppercase(),
            style = TextStyle(fontSize = 20.sp,fontWeight = FontWeight.Bold),
            color = MaterialTheme.colorScheme.onPrimary
        )
    }
}