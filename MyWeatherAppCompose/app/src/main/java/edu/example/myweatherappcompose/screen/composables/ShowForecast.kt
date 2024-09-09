package edu.example.myweatherappcompose.screen.composables

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import edu.example.myweatherappcompose.R
import edu.example.myweatherappcompose.data.GetForecastResponse

@Composable
fun ShowForecast(forecastData: GetForecastResponse) {
    val forecastList = forecastData.list ?: emptyList()

    LazyColumn(
        modifier = Modifier
            .fillMaxHeight()
            .background(color = MaterialTheme.colorScheme.primary)
    ) {
        items(forecastList.size) { index ->
            val item = forecastList[index]
            val notFound = stringResource(id = R.string.resource_not_found)
            val weather = item.weather?.firstOrNull()
            val dtTxt = item.dtTxt?.split(" ") ?: emptyList()
            val day = if (dtTxt.size == 2) dtTxt.first() else notFound
            val time = if (dtTxt.size == 2) dtTxt.last() else notFound
            var initialTime = ""
            if (time != notFound) {
                val temp: MutableList<String> = time.split(":").toMutableList()
                if (temp.isNotEmpty()) {
                    temp[0] = (((temp.first().toIntOrNull() ?: 3) - 3).mod(24)).toString()
                    if (temp[0].length == 1) temp[0] = "0${temp[0]}"
                }
                initialTime = temp.joinToString(":")
            }
            ForecastListItem(
                time = "$initialTime -\n $time",
                icon = weather?.icon ?: "",
                description = weather?.description ?: notFound,
                temp = item.main?.temp ?: -1.0,
                tempMin = item.main?.tempMin ?: -1.0,
                tempMax = item.main?.tempMax ?: -1.0,
                feelsLike = item.main?.feelsLike ?: -1.0,
                humidity = item.main?.humidity ?: -1,
                day = day,
                showDay = index == 0 || time == "03:00:00"
            )
        }
    }
}