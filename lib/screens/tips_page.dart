import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("⚡ Energy Conservation Tips"),
        backgroundColor: Colors.green[700],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFB2FF59), // Light green
              Color(0xFF69F0AE), // Teal green
            ],
          ),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "1️⃣ Switch Off When Not in Use – Turn off lights, fans, and appliances when leaving a room.\n"
              "2️⃣ Use Energy-Efficient Appliances – Prefer LED bulbs, inverter ACs, and energy-star rated devices.\n"
              "3️⃣ Limit Peak-Hour Usage – Run heavy appliances like washing machines or ovens during non-peak hours.\n"
              "4️⃣ Unplug Idle Devices – Chargers, TVs, and computers still consume power when plugged in.\n"
              "5️⃣ Optimize Air Conditioning – Keep AC temperature at 24–26°C; use fans for air circulation.\n"
              "6️⃣ Use Natural Light & Ventilation – Open curtains and windows to reduce dependence on electric lights and fans.\n"
              "7️⃣ Maintain Appliances Properly – Clean filters, coils, and perform regular servicing for efficiency.\n"
              "8️⃣ Insulate Your Home – Proper sealing reduces heating and cooling losses.\n"
              "9️⃣ Use Smart Meters & Timers – Helps monitor and control electricity usage effectively.\n"
              "🔟 Educate Household Members – Awareness and small habits can save a lot of energy collectively.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}