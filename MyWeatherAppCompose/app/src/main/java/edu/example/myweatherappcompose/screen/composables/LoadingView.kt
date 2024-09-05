package edu.example.myweatherappcompose.screen.composables

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.size
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.ColorFilter
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.unit.dp
import edu.example.myweatherappcompose.R

@Composable
fun LoadingView(message: String, color: Color = MaterialTheme.colorScheme.primary) {
    Column {
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
        Spacer(modifier = Modifier.height(10.dp))
        Text(text = message, style = TextStyle(color = color))
    }
}