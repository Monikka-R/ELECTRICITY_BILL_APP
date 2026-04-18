import 'package:flutter/material.dart';
import 'bill_page.dart';
import 'meter_page.dart';
import 'tips_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Electricity App"),
        centerTitle: true,
      ),

      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0ecff), Color(0xFFf5f7fa)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          children: [

            const SizedBox(height: 20),

            // 🔷 Title
            const Text(
              "Welcome ⚡",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Options
            Expanded(
              child: Column(
                children: [

                  // 1️⃣ Calculate Bill
                  _buildCard(
                    context,
                    title: "Calculate Bill",
                    icon: Icons.calculate,
                    color1: const Color(0xFF00c6ff),
                    color2: const Color(0xFF0072ff),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BillPage(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // 2️⃣ Meter Guide
                  _buildCard(
                    context,
                    title: "Steps to Check Electricity Units",
                    icon: Icons.electric_meter,
                    color1: const Color(0xFF56ab2f),
                    color2: const Color(0xFFa8e063),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MeterPage(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // 3️⃣ Tips
                  _buildCard(
                    context,
                    title: "⚡ Energy Conservation ",
                    icon: Icons.lightbulb,
                    color1: const Color(0xFFFF8008),
                    color2: const Color(0xFFFFC837),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TipsPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // 🔷 Reusable Card Widget
  Widget _buildCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color1,
    required Color color2,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 90,
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [color1, color2]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
            ),
          ],
        ),

        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}