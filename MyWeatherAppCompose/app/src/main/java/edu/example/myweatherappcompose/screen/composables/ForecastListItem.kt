package edu.example.myweatherappcompose.screen.composables

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.material3.Card
import androidx.compose.material3.CardColors
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import edu.example.myweatherappcompose.R

@Composable
fun ForecastListItem(
    time: String,
    icon: String,
    description: String,
    temp: Double,
    tempMin: Double,
    tempMax: Double,
    feelsLike: Double,
    humidity: Int,
    day: String,
    showDay: Boolean = false
) {
    Column {
        if (showDay) Box(
            modifier = Modifier
                .fillMaxWidth()
                .height(50.dp)
                .background(color = MaterialTheme.colorScheme.primary),
            contentAlignment = Alignment.Center
        ) {
            Text(
                text = day,
                style = TextStyle(color = MaterialTheme.colorScheme.onPrimary, fontSize = 20.sp),
            )
        }
        Card(
            onClick = { /*TODO*/ },
            modifier = Modifier
                .padding(vertical = 10.dp),
            colors = CardColors(
                containerColor = MaterialTheme.colorScheme.primaryContainer,
                contentColor = MaterialTheme.colorScheme.onPrimaryContainer,
                disabledContentColor = MaterialTheme.colorScheme.primaryContainer,
                disabledContainerColor = MaterialTheme.colorScheme.onPrimaryContainer
            )
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth().height(120.dp),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                Text(text = time)
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    IconImage(
                        path = icon,
                        size = 80.dp,
                        description = description,
                        color = MaterialTheme.colorScheme.primary
                    )
                }
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                    ) {
                        Text(text = "$temp°")
                        Spacer(modifier = Modifier.width(10.dp))
                        Column {
                            Text(text = "${stringResource(id = R.string.max_label)} $tempMax°")
                            Text(text = "${stringResource(id = R.string.min_label)} $tempMin°")
                        }
                    }
                    Text(text = "${stringResource(id = R.string.feels_like_label)} $feelsLike°")
                    Text(text = "${stringResource(id = R.string.humidity_label)} $humidity%")
                }
            }
        }
    }
}