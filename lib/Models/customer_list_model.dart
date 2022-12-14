class Customerlistmodel {
  final int custid;
  final String custname;
  // final String custlname;
  final int custphoneno;

  const Customerlistmodel({
    required this.custid,
    required this.custname,
    // required this.custlname,
    required this.custphoneno,
  });

  factory Customerlistmodel.fromJson(Map<String, dynamic> json) => Customerlistmodel(
    custid: json['cid'],
    custname: json['name'],
    // custlname: json["lastname"],
    custphoneno: json["phonenumber"],
  );
}
