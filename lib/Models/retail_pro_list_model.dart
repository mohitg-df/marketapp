class Retailprolistmodel {
  int rproid;
  double rproprice;
  String rproname;
  int rproquantity;
  String rhindiname;

  Retailprolistmodel({
    required this.rproid,
    required this.rproprice,
    required this.rproname,
    required this.rproquantity,
    required this.rhindiname,
  });

  factory Retailprolistmodel.fromJson(Map<String, dynamic> json) =>
      Retailprolistmodel(
        rproid: json["productId"],
        rproprice: json["prize"],
        rproname: json["name"],
        rproquantity: json["quantity"],
        rhindiname: json["hindiname"],
      );
}
