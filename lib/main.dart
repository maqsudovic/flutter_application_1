import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _temperature = 0.0;
  String _selectedUnit = "Celsius";

  void _convert(String unit) {
    setState(() {
      _selectedUnit = unit;
      if (unit == "Celsius") {
        // Convert from Fahrenheit to Celsius
        _temperature = (_temperature - 32) * 5 / 9;
      } else {
        // Convert from Celsius to Fahrenheit
        _temperature = (_temperature * 9 / 5) + 32;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Temperature Converter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter temperature",
                ),
                onChanged: (value) {
                  setState(() {
                    _temperature = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_temperature.toStringAsFixed(1)),
                  Text(_selectedUnit == "Celsius" ? "°C" : "°F"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _convert("Celsius"),
                    child: Text("To Celsius"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _convert("Fahrenheit"),
                    child: Text("To Fahrenheit"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
