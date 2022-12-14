class OrderHistModel {
  int? id;
  int? productid;
  String? productname;
  String? hindiproname;
  double? productPrize;
  int? quantity;
  double? totalcostofProduct;
  double? totalcost;
  String? date;

  OrderHistModel({
    this.id,
    this.productid,
    this.productname,
    this.hindiproname,
    this.productPrize,
    this.quantity,
    this.totalcostofProduct,
    this.totalcost,
    this.date,
  });

  factory OrderHistModel.fromJson(Map<String, dynamic> json) => OrderHistModel(
        id: json['id'],
        productid: json['productid'],
        productname: json['productname'],
        hindiproname: json['hindiName'],
        productPrize: json['productPrize'],
        quantity: json['quantity'],
        totalcostofProduct: json['totalcostofProduct'],
        totalcost: json['totalcost'],
        date: json['creadedDate'],
      );
}
