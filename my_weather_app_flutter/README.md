# my_weather_app_flutter

A Flutter application that shows the current weather and the forecast for the following days.

## Description

my-weather_app_flutter uses the [Locator library](https://pub.dev/packages/location) to manage permissions and access the device's location.
It then makes requests to the [OpenWeatherMap API](https://openweathermap.org/current) to obtain data corresponding to the current weather and future forecasts of the device's location.
Some of the data provided by the API are a short description of the `weather`, `temperature` (minimum and maximum), `feels-like temperature`, `humidity`, etc.

## Getting Started

### Dependencies

To run the application, you need to have [Flutter](https://docs.flutter.dev/get-started/install) installed in your computer.
[Here](https://docs.flutter.dev/get-started/install/windows/desktop) you can verify if your computer meets the system requirements to install and run Flutter.

### Setting up project

1. Clone the repository from github. If you do not have Git installed click [Here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
In your terminal or command propt, use the following command to clone the repository:

```
git clone https://github.com/your-username/my-weather-app.git

```
Replace `your-username` with your GitHub username.

2. cd into my_weather_app_flutter.

3. Use the command `flutter pub get` to get all the dependencies.

### Running app

Connect your android device/emulator using [adb](https://developer.android.com/tools/adb).
Use the following command to build and run the app in debug mode:

```
flutter run
```
Finally, if the application is installed and run successfully in the device, the first thing it will prompt is a permission request to access the device location. You must accept to continue.

### Configuration

You can change the [OpenWeatherMap API](https://openweathermap.org/current) key by changing the value of the constant `appid` located in libs/utils/constants.dart





