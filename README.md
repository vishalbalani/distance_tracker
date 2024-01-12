# Flutter Distance Tracker App

A Flutter application that tracks the distance traveled without relying on internet connectivity. It uses the device's native geolocation capabilities through the `geolocator` package.

## Features

- Start and stop tracking the distance traveled.
- Display the total distance in real-time.
- Utilizes the device's native geolocation features.
- Minimalistic and easy-to-use UI.

## Accuracy

In geolocation, accuracy refers to the reliability of location data. This app considers the reported accuracy of the device's geolocation updates:

- The reported accuracy is an estimate of the likely radius within which the actual location resides.
- A 10-meter threshold is applied to filter out stationary points, enhancing the reliability of distance calculations.
- Accuracy can also depend on the capabilities of the device's GPS hardware, the availability of satellite signals, and environmental conditions.

## Fun Fact

The geolocator package in Flutter provides distance calculations using the Haversine formula. This widely used formula accurately calculates distances between two points on the surface of a sphere, such as the Earth. It takes into account the spherical shape of the Earth and provides reliable distance measurements.

## Getting Started

### Prerequisites

- Flutter installed on your machine.
- A physical device or an emulator with location services enabled.

For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.
