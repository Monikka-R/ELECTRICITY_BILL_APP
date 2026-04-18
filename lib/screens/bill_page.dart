import 'package:flutter/material.dart';
import '../services/bill_calculator.dart';
import '../widgets/slab_card.dart';
import '../models/slab.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  final TextEditingController controller = TextEditingController();

  int units = 0;
  double total = 0;
  List<Slab> slabs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Electricity Bill"),
        centerTitle: true,
        elevation: 0,
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

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔷 Title
              const Text(
                "Enter Units",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // 🔷 Input Field
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter units (e.g. 350)",
                  prefixIcon: const Icon(Icons.flash_on),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  units = int.tryParse(value) ?? 0;
                },
              ),

              const SizedBox(height: 20),

              // 🔘 Calculate Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    setState(() {
                      var result =
                          BillCalculator.calculateBill(units);

                      total = result["total"];
                      slabs = List<Slab>.from(result["slabs"]);
                    });
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
              ),

              const SizedBox(height: 25),

              // 📊 Slab Breakdown
              if (slabs.isNotEmpty) ...[
                const Text(
                  "Slab Breakdown",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Column(
                  children: slabs
                      .map((s) => SlabCard(slab: s))
                      .toList(),
                ),

                const SizedBox(height: 20),

                // 💰 Total
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey.shade300,
                      ),
                    ],
                  ),
                  child: Text(
                    "Total Bill: ₹${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}