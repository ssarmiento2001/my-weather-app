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

You can change the [OpenWeatherMap API](https://openweathermap.org/current) key by changing the value of the constant `appid` located in lib/utils/constants.dart

## Screenshots

### Splash screen
![Captura de pantalla 2024-08-25 103718](https://github.com/user-attachments/assets/c4bb09f3-7338-49c5-b20d-0c489fb07edc)

### Location permission request
![Captura de pantalla 2024-08-25 103733](https://github.com/user-attachments/assets/9cda8b18-7428-4ed4-a0a8-4f03cfcdbf17)

### Loading screen
![Captura de pantalla 2024-08-25 104408](https://github.com/user-attachments/assets/5470d029-2682-4c43-93ee-d79c991b172a)

### Failure screen
![Captura de pantalla 2024-08-25 103848](https://github.com/user-attachments/assets/57991e20-30a3-47f6-afb1-2dae4a1ab6ae)

### Homepage screen (current weather)
![Captura de pantalla 2024-08-25 104106](https://github.com/user-attachments/assets/f3a08592-0c32-48ca-9c15-d9a58a01c1d4)

### Homepage screen landscape
![Captura de pantalla 2024-08-25 104130](https://github.com/user-attachments/assets/eacc34d1-e512-455c-a9f8-702da6d914ea)

### Forecast screen
![Captura de pantalla 2024-08-25 114053](https://github.com/user-attachments/assets/e08aaa47-d41b-4327-8921-cc5a1a6cde9a)

