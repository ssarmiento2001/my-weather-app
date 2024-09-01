package edu.example.myweatherappcompose.screen

sealed class Screen(val route: String) {
    data object RequestPermission : Screen("request-permission")
    data object HomePage : Screen("home-page")
    data object Failure : Screen("failure")
}