class Wholesaleprolistmodel {
  int proid;
  double proprice;
  String proname;
  int proquantity;
  String hindiname;

  Wholesaleprolistmodel({
    required this.proid,
    required this.proprice,
    required this.proname,
    required this.proquantity,
    required this.hindiname,
  });


  factory Wholesaleprolistmodel.fromJson(Map<String, dynamic> json) => Wholesaleprolistmodel(
    proid: json['productId'],
    proprice: json['prize'],
    proname: json["name"],
    proquantity: json["quantity"],
    hindiname: json["hindiname"],
  );
}
