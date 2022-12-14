import 'package:marketapp/Models/customer.dart';
import 'package:marketapp/Models/supplier.dart';

class Invoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<InvoiceItem> items;

  const Invoice({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

// class InvoiceItem {
//   final String description;
//   final DateTime date;
//   final int quantity;
//   final double vat;
//   final double unitPrice;
//
//   const InvoiceItem({
//     required this.description,
//     required this.date,
//     required this.quantity,
//     required this.vat,
//     required this.unitPrice,
//   });
// }

class InvoiceItem {
  int proid;
  String proname;
  int proprice;
  int proquantity;
  String hindiname;
  double totalcostofpro;
  double totalcost;

  InvoiceItem({
    required this.proid,
    required this.proname,
    required this.proprice,
    required this.proquantity,
    required this.hindiname,
    required this.totalcostofpro,
    required this.totalcost,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) => InvoiceItem(
        proid: json['productid'],
        proname: json["productname"],
        proprice: json['productPrize'],
        proquantity: json["quantity"],
        hindiname: json["phindiName"],
        totalcostofpro: json['totalcostofProduct'],
        totalcost: json['totalcost'],
      );
}
