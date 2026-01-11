import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/sensor_card.dart';
import '../widgets/toggle_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double potensiometer = 50;
  double suhu = 25;
  double kelembaban = 60;
  bool deviceOn = false;

  final Random random = Random();

  void generateSensor() {
    setState(() {
      suhu = 20 + random.nextInt(15).toDouble();
      kelembaban = 40 + random.nextInt(40).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sensor Simulator"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: generateSensor,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SensorCard(
              title: "Potensiometer",
              value: potensiometer.toStringAsFixed(0),
              icon: Icons.tune,
            ),
            Slider(
              min: 0,
              max: 100,
              value: potensiometer,
              onChanged: (value) {
                setState(() {
                  potensiometer = value;
                });
              },
            ),
            SensorCard(
              title: "Temperature",
              value: "$suhu °C",
              icon: Icons.thermostat,
            ),
            SensorCard(
              title: "Humidity",
              value: "$kelembaban %",
              icon: Icons.water_drop,
            ),
            ToggleCard(
              isOn: deviceOn,
              onChanged: (value) {
                setState(() {
                  deviceOn = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
