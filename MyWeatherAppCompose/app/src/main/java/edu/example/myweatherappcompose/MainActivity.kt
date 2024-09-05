package edu.example.myweatherappcompose

import android.content.Context
import android.os.Build
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.annotation.RequiresApi
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.safeDrawingPadding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import edu.example.myweatherappcompose.screen.ForecastScreen
import edu.example.myweatherappcompose.screen.HomePage
import edu.example.myweatherappcompose.screen.RequestPermissionScreen
import edu.example.myweatherappcompose.screen.Screen
import edu.example.myweatherappcompose.ui.theme.MyWeatherAppComposeTheme
import androidx.lifecycle.viewmodel.compose.viewModel
import edu.example.myweatherappcompose.screen.composables.ErrorView
import edu.example.myweatherappcompose.utils.LocationUtils
import edu.example.myweatherappcompose.viewModel.HomePageViewModel

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
    val viewModel: HomePageViewModel = viewModel()
    val locationUtils = LocationUtils(context = context)
    NavHost(navController = navHostController, startDestination = Screen.RequestPermission.route) {
        composable(Screen.RequestPermission.route) {
            RequestPermissionScreen(
                onPermissionGranted = { navHostController.navigate(Screen.HomePage.route) }
            )
        }

        composable(Screen.HomePage.route) {
            if (locationUtils.hasLocationPermission()) {
                HomePage(locationUtils = locationUtils, viewModel = viewModel)
            } else {
                ErrorView(
                    title = stringResource(id = R.string.permission_denied_title),
                    description = stringResource(
                        id = R.string.rationale
                    )
                )
            }
        }

        composable(Screen.Forecast.route) {
            ForecastScreen()
        }
    }
}
