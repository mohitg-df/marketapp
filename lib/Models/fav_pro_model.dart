class Favprolistmodel {
  int? proid;
  String? proname;
  String? hindiproname;
  double? proprice;
  // int? proquantity;
  String? protype;

  Favprolistmodel({
    this.proid,
    this.proname,
    this.hindiproname,
    this.proprice,
    // this.proquantity,
    this.protype,
  });


  factory Favprolistmodel.fromJson(Map<String, dynamic> json) => Favprolistmodel(
    proid: json['productId'],
    proname: json['name'],
    hindiproname: json['hindiname'],
    proprice: json['prize'],
    // proquantity: json['quantity'],
    protype: json['type'],
  );
}