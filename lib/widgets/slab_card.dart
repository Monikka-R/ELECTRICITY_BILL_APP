import 'package:flutter/material.dart';
import '../models/slab.dart';

class SlabCard extends StatelessWidget {
  final Slab slab;

  const SlabCard({super.key, required this.slab});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            slab.range,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            "${slab.units} × ${slab.rate}",
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            "₹${slab.amount.toStringAsFixed(1)}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}