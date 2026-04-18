import '../models/slab.dart';

class BillCalculator {
  static Map<String, dynamic> calculateBill(int units) {
    double total = 0;
    List<Slab> slabs = [];

    if (units <= 500) {
  // 🔷 UNDER 500

  // 101–200
  if (units > 100) {
    double u1 = (units > 200) ? 100 : (units - 100);
    double amt = u1 * 2.35;
    slabs.add(Slab(range: "101-200", units: u1, rate: 2.35, amount: amt));
    total += amt;
  }

  // 201–400
  if (units > 200) {
    double u2 = (units > 400) ? 200 : (units - 200);
    double amt = u2 * 4.7;
    slabs.add(Slab(range: "201-400", units: u2, rate: 4.7, amount: amt));
    total += amt;
  }

  // 401–500
  if (units > 400) {
    double u3 = units - 400;
    double amt = u3 * 6.3;
    slabs.add(Slab(range: "401-500", units: u3, rate: 6.3, amount: amt));
    total += amt;
  }
} else {
      // ABOVE 500 SLAB

      // 101–400
      double u1 = (units > 400) ? 300 : (units - 100);
      if (u1 > 0) {
        double amt = u1 * 4.7;
        slabs.add(Slab(range: "101-400", units: u1, rate: 4.7, amount: amt));
        total += amt;
      }

      // 401–500
      double u2 = (units > 500) ? 100 : (units - 400);
      if (u2 > 0) {
        double amt = u2 * 6.3;
        slabs.add(Slab(range: "401-500", units: u2, rate: 6.3, amount: amt));
        total += amt;
      }

      // 501–600
      double u3 = (units > 600) ? 100 : (units - 500);
      if (u3 > 0) {
        double amt = u3 * 8.4;
        slabs.add(Slab(range: "501-600", units: u3, rate: 8.4, amount: amt));
        total += amt;
      }

      // 601–800
      double u4 = (units > 800) ? 200 : (units - 600);
      if (u4 > 0) {
        double amt = u4 * 9.45;
        slabs.add(Slab(range: "601-800", units: u4, rate: 9.45, amount: amt));
        total += amt;
      }

      // 801–1000
if (units > 800) {
  double u5 = (units > 1000) ? 200 : (units - 800);
  double amt = u5 * 10.5;
  slabs.add(Slab(range: "801-1000", units: u5, rate: 10.5, amount: amt));
  total += amt;
}

// 1001+
if (units > 1000) {
  double u6 = units - 1000;
  double amt = u6 * 11.55;
  slabs.add(Slab(range: "1001+", units: u6, rate: 11.55, amount: amt));
  total += amt;
}
    }

    return {
      "total": total,
      "slabs": slabs,
    };
  }
}