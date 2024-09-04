package edu.example.myweatherappcompose.screen.composables

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.size
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.ColorFilter
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import edu.example.myweatherappcompose.R

@Composable
fun LoadingView(color: Color = MaterialTheme.colorScheme.primary) {
    Box(contentAlignment = Alignment.Center) {
        Image(
            colorFilter = ColorFilter.tint(color),
            modifier = Modifier.size(80.dp),
            painter = painterResource(id = R.drawable.load_icon),
            contentDescription = null
        )
        CircularProgressIndicator(
            modifier = Modifier.then(Modifier.size(120.dp)),
            color = color
        )
    }
}