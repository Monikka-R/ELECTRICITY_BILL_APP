import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final double bill;
  final List<String> tips;

  const ResultCard({super.key, required this.bill, required this.tips});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Your Bill",
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          Text(
            "₹ ${bill.toStringAsFixed(2)}",
            style: const TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const Text("Tips:",
              style: TextStyle(fontWeight: FontWeight.bold)),
          ...tips.map((t) => Text("• $t")),
        ],
      ),
    );
  }
}