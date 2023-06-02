# Weather App

The Weather App is a beginner's iOS application that provides weather information for five different cities. It utilizes REST API and URLSession to fetch weather data from an external source. The data is then decoded using JSONDecoder to extract relevant information. The project follows the MVVM (Model-View-ViewModel) design architecture, ensuring separation of concerns and easy maintenance. Unit tests have been implemented using XCTest to validate the app's functionality and enhance reliability.

## Features

- Fetches weather data for five different cities.
- Displays current weather information, including temperature, humidity, wind speed, and more.
- Utilizes REST API and URLSession for data retrieval.
- Decodes JSON response using JSONDecoder for efficient parsing.
- Follows the MVVM design architecture for modular and maintainable code.
- Includes Unit Test cases using XCTest to ensure app functionality.


## Screen Shots

### 1. Launch Screen
<p align="center">
  <img src="https://github.com/venkinyamagoudar/Weather/assets/109290394/32c21882-12b1-40e7-891f-5c378cf48613" alt="Launch Screen" width="300" height="600">
</p>

### 2. Home Page
<p align="center">
  <img src="https://github.com/venkinyamagoudar/Weather/assets/109290394/29612c3b-9e8b-4409-a973-772e38d315d4" alt="Home Page" width="300" height="600">
</p>

### 3. Choose Cities
<p align="center">
  <img src="https://github.com/venkinyamagoudar/Weather/assets/109290394/84061919-7784-423c-becb-039fa63ad83f" alt="Choose Cities" width="300" height="600">
</p>

### 4. Weather of Chosen City
<p align="center">
  <img src="https://github.com/venkinyamagoudar/Weather/assets/109290394/b118b759-f6c1-4407-92b9-fe909e2077d5" alt="Weather of Chosen City" width="300" height="600">
</p>


## Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.0+

## Installation

1. Clone or download the Weather App repository to your local machine.

2. Open the project in Xcode.

3. Build and run the project on the iOS Simulator or a physical device.

## Usage

1. Launch the Weather App on your iOS device or simulator.

2. The app will display weather information for the pre-configured cities.

3. Tap on a city to view the detailed weather information, including temperature, humidity, wind speed, and other relevant data.

4. The app will periodically update the weather data or provide an option to manually refresh using a dedicated button.

## Architecture

The Weather App is developed following the MVVM (Model-View-ViewModel) design architecture. Here's a high-level overview of each component:

- **Model**: Contains the data structures and logic for fetching weather data from the REST API.
- **View**: Handles the user interface and displays the weather information to the user.
- **ViewModel**: Acts as a mediator between the Model and View, providing data and methods to update and display weather information.

## Unit Testing

The Weather App includes Unit Test cases implemented using XCTest. These tests are designed to cover different scenarios and ensure the correctness of the ViewModel's behavior. Running the Unit Tests helps validate the app's functionality and identify any issues or regressions.

To run the Unit Tests:
1. Open the Weather App project in Xcode.
2. Navigate to the test target folder.
3. Run the tests by selecting Product -> Test or using the CMD+U shortcut.

## Contributing

Contributions to the Weather App are welcome! If you would like to contribute, please follow these guidelines:

1. Fork the repository and clone it to your local machine.
2. Create a new branch for your feature or bug fix.
3. Implement your changes, following the existing code style and architecture.
4. Write additional Unit Tests to cover the new functionality or changes.
5. Commit your changes and push them to your forked repository.
6. Open a pull request, providing a detailed description of your changes and any relevant information.
