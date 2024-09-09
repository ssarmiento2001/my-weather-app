package edu.example.myweatherappcompose.screen.composables

import android.content.res.Configuration
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.DateRange
import androidx.compose.material.icons.outlined.DateRange
import androidx.compose.material3.ButtonColors
import androidx.compose.material3.FilledTonalButton
import androidx.compose.material3.FilledTonalIconButton
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.MutableState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import edu.example.myweatherappcompose.R
import edu.example.myweatherappcompose.data.GetWeatherResponse

@Composable
fun ShowWeather(
    address: MutableState<String?>,
    weatherData: GetWeatherResponse,
    onButtonPressed: () -> Unit
) {

    val configuration = LocalConfiguration.current
    val isLandscape = configuration.orientation == Configuration.ORIENTATION_LANDSCAPE

    val textColor = MaterialTheme.colorScheme.onPrimary
    val description = weatherData.weather?.firstOrNull()?.description ?: "No description"
    val icon = weatherData.weather?.firstOrNull()?.icon ?: ""
    val sky = if (icon.isNotEmpty() && icon.last() == 'd') listOf(
        Color(0xFF62cff4),
        Color(0xFF2c67f2)
    ) else listOf(
        Color.Black,
        Color(0xFF243484)
    )

    if (isLandscape) {
        Row(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    Brush.verticalGradient(
                        sky
                    )
                ),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Header(address, textColor, icon, description)
            TemperatureSection(weatherData, TextStyle(fontSize = 25.sp), textColor, onButtonPressed)
        }
    } else {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    Brush.verticalGradient(
                        sky
                    )
                ),
            verticalArrangement = Arrangement.SpaceEvenly,
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Header(address, textColor, icon, description)
            TemperatureSection(weatherData, TextStyle(fontSize = 25.sp), textColor, onButtonPressed)
        }
    }
}

@Composable
private fun Header(
    address: MutableState<String?>,
    textColor: Color,
    icon: String,
    description: String
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Text(
            modifier = Modifier.width(400.dp),
            text = address.value ?: "No address",
            textAlign = TextAlign.Center,
            style = TextStyle(fontSize = 25.sp, fontWeight = FontWeight.Bold),
            color = textColor,
            maxLines = 3,
            overflow = TextOverflow.Ellipsis
        )
        Spacer(modifier = Modifier.height(20.dp))
        IconImage(
            path = icon,
            size = 120.dp,
            description = description,
            color = MaterialTheme.colorScheme.onPrimary
        )
    }
}

@Composable
private fun TemperatureSection(
    weatherData: GetWeatherResponse,
    textStyle: TextStyle,
    textColor: Color,
    onButtonPressed: () -> Unit
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Image(
                modifier = Modifier.size(80.dp),
                painter = painterResource(id = R.drawable.thermometer_icon),
                contentDescription = null
            )
            Text(
                text = "${weatherData.main?.temp.toString()}°",
                style = TextStyle(fontSize = 40.sp, fontWeight = FontWeight.Bold),
                color = textColor
            )
            Spacer(modifier = Modifier.width(20.dp))
            Column {
                Text(
                    text = "${stringResource(id = R.string.max_label)} ${weatherData.main?.tempMax.toString()}°",
                    color = textColor,
                    style = textStyle
                )
                Text(
                    text = "${stringResource(id = R.string.min_label)} ${weatherData.main?.tempMin.toString()}°",
                    color = textColor,
                    style = textStyle
                )
            }
        }
        Spacer(modifier = Modifier.height(20.dp))
        Text(
            text = "${stringResource(id = R.string.feels_like_label)} ${weatherData.main?.feelsLike.toString()}°",
            color = textColor,
            style = textStyle
        )
        Spacer(modifier = Modifier.height(20.dp))
        Text(
            text = "${stringResource(id = R.string.humidity_label)} ${weatherData.main?.humidity.toString()}%",
            color = textColor,
            style = textStyle
        )
        Spacer(modifier = Modifier.height(20.dp))
        FilledTonalButton(
            colors = ButtonColors(
                containerColor = MaterialTheme.colorScheme.primaryContainer,
                contentColor = MaterialTheme.colorScheme.onPrimaryContainer,
                disabledContentColor = MaterialTheme.colorScheme.error,
                disabledContainerColor = MaterialTheme.colorScheme.errorContainer
            ),
            onClick = { onButtonPressed() }) {
            Row(
                modifier = Modifier.width(150.dp),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                Icon(
                    imageVector = Icons.Default.DateRange,
                    contentDescription = stringResource(id = R.string.forecast_button)
                )
                Text(stringResource(id = R.string.forecast_button), style = textStyle)
            }
        }
    }
}