import 'package:flutter/material.dart';
import '../services/bill_calculator.dart';

class CalculateButton extends StatelessWidget {
  final int units;
  final Function(double, List) onCalculated;

  const CalculateButton({
    super.key,
    required this.units,
    required this.onCalculated,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
        ),
        onPressed: () {
          FocusScope.of(context).unfocus();

          var result = BillCalculator.calculateBill(units);
          double total = result["total"];
          List slabs = result["slabs"];

          onCalculated(total, slabs); // send data back
        },
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF00c6ff),
                Color(0xFF0072ff),
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calculate, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Calculate Bill",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}