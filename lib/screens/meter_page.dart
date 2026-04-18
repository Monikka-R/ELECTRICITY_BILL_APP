import 'package:flutter/material.dart';

class MeterPage extends StatelessWidget {
  const MeterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Steps to Check Electricity Units"),
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF81D4FA), // Light blue
              Color(0xFF29B6F6), // Medium blue
            ],
          ),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "To read units from your energy meter:\n\n"
              "1️⃣ Note the current reading displayed on the meter in kWh.\n"
              "2️⃣ Find your previous meter reading from your last bill or record.\n"
              "3️⃣ Subtract the previous reading from the current reading to get the number of units consumed.\n"
              "4️⃣ For digital meters, include decimal values if shown for accuracy.\n"
              "5️⃣ The result is the total electricity units used for this billing period.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}