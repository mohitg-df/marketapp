class CartModel {
  int? id;
  int? productid;
  String? productname;
  String? hindiproname;
  int? productPrize;
  int? quantity;
  double? totalcostofProduct;
  double? totalcost;

  CartModel({
    this.id,
    this.productid,
    this.productname,
    this.hindiproname,
    this.productPrize,
    this.quantity,
    this.totalcostofProduct,
    this.totalcost,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      id: json['id'],
      productid: json['productid'],
      productname: json['productname'],
      hindiproname: json['phindiName'],
      productPrize: json['productPrize'],
      quantity: json['quantity'],
      totalcostofProduct: json['totalcostofProduct'],
      totalcost: json['totalcost']);
}
