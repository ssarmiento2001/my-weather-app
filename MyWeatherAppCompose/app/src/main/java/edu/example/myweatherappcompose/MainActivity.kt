package edu.example.myweatherappcompose

import android.content.Context
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.safeDrawingPadding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import edu.example.myweatherappcompose.screen.ForecastScreen
import edu.example.myweatherappcompose.screen.HomePage
import edu.example.myweatherappcompose.screen.RequestPermissionScreen
import edu.example.myweatherappcompose.screen.Screen
import edu.example.myweatherappcompose.ui.theme.MyWeatherAppComposeTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            val navController = rememberNavController()
            val context = LocalContext.current
            MyWeatherAppComposeTheme {
                Surface(
                    modifier = Modifier
                        .fillMaxSize()
                        .safeDrawingPadding(),
                    color = MaterialTheme.colorScheme.primary
                ) {
                    Navigation(
                        context = context,
                        navHostController = navController
                    )
                }
            }
        }
    }
}

@Composable
fun Navigation(
    context: Context,
    navHostController: NavHostController
) {
    NavHost(navController = navHostController, startDestination = Screen.RequestPermission.route) {
        composable(Screen.RequestPermission.route) {
            RequestPermissionScreen(
                onPermissionGranted = { navHostController.navigate(Screen.HomePage.route) }
            )
        }

        composable(Screen.HomePage.route) {
            HomePage()
        }

        composable(Screen.Forecast.route) {
            ForecastScreen()
        }
    }
}
