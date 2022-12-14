import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/Controllers/add_product_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Addproductwidgetcomponent extends StatefulWidget {
  @override
  _AddproductwidgetcomponentState createState() =>
      _AddproductwidgetcomponentState();
}

class _AddproductwidgetcomponentState
    extends StateMVC<Addproductwidgetcomponent> {

  late Addproductauthcontroller _addproductauthcontroller;

  _AddproductwidgetcomponentState() : super(Addproductauthcontroller()) {
    this._addproductauthcontroller = controller as Addproductauthcontroller;
  }

  bool _isLoading = false;

  TextEditingController _productname = TextEditingController();
  TextEditingController _hindiproname = TextEditingController();
  TextEditingController _rate = TextEditingController();
  TextEditingController _quantity = TextEditingController();
  // TextEditingController _prodcttype = TextEditingController();


  String? _producttype;
  String? _category;
  String? _unit;
  var producttype = [
    'WHOLESALE',
    'RETAIL',
  ];
  var unittype = [
    'KG',
    'GRAM',
  ];
  var categorytype = [
    'FOOD',
    'Grocery',
  ];

  void cleartext(){
    _productname.clear();
    _rate.clear();
    _quantity.clear();
    // _producttype.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.0, right: 30.0, top: 30.0, bottom: 30.0),
      child: Center(
        child: Form(
          key: _addproductauthcontroller.addproductformkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "Add Products Here !",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  height: 10 * MediaQuery.of(context).size.height * 0.01,
                ),
                DropdownButtonFormField(
                  value: _producttype,
                  // style: hintstyle(context),
                  validator: (item) {
                    if (item == null) {
                      return 'Select Product Type';
                    }
                    return null;
                  },
                  hint: AutoSizeText(
                    "Choose Product Type",
                    style: TextStyle(fontSize: 16.0),
                    // style: hintstyle(context),
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.merge_type,
                      size: 22,
                    ),
                  ),
                  items: producttype.map((String categorytype) {
                    return DropdownMenuItem(
                      value: categorytype,
                      child: Text(categorytype),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    _addproductauthcontroller.addproductmodel.producttype =
                        newValue;
                    setState(() {
                      _producttype = newValue!;
                    });
                  },
                ),
                SizedBox(
                  height: 50 * MediaQuery.of(context).size.height * 0.001,
                ),
                DropdownButtonFormField(
                  value: _category,
                  // style: hintstyle(context),
                  validator: (item) {
                    if (item == null) {
                      return 'Select Product Category';
                    }
                    return null;
                  },
                  hint: AutoSizeText(
                    "Choose Product Category",
                    style: TextStyle(fontSize: 16.0),
                    // style: hintstyle(context),
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.category,
                      size: 22,
                    ),
                  ),
                  items: categorytype.map((String categorytype) {
                    return DropdownMenuItem(
                      value: categorytype,
                      child: Text(categorytype),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    _addproductauthcontroller.addproductmodel.productcategory =
                        newValue;
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
                SizedBox(
                  height: 50 * MediaQuery.of(context).size.height * 0.001,
                ),
                TextFormField(
                  controller: _productname,
                  // style: hintstyle(context),
                  validator: (String? item) {
                    _addproductauthcontroller.addproductmodel.productname =
                        item;
                    if (item!.isEmpty) {
                      return "Enter Product Name";
                    }
                    return null;
                  },
                  onSaved: (_productname) => _addproductauthcontroller
                      .addproductmodel.productname = _productname,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.production_quantity_limits_sharp,
                      size: 22.0,
                    ),
                    hintText: "Enter Product Name",
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50 * MediaQuery.of(context).size.height * 0.001,
                ),
                TextFormField(
                  controller: _hindiproname,
                  // style: hintstyle(context),
                  validator: (String? item) {
                    _addproductauthcontroller.addproductmodel.hindiproductname =
                        item;
                    if (item!.isEmpty) {
                      return "Enter Hindi Product Name";
                    }
                    return null;
                  },
                  onSaved: (_hindiproname) => _addproductauthcontroller
                      .addproductmodel.hindiproductname = _hindiproname,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.translate,
                      size: 22.0,
                    ),
                    hintText: "Enter Hindi Product Name",
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50 * MediaQuery.of(context).size.height * 0.001,
                ),
                DropdownButtonFormField(
                  value: _unit,
                  validator: (item) {
                    if (item == null) {
                      return 'Select Product Unit';
                    }
                    return null;
                  },
                  hint: AutoSizeText(
                    "Choose product Unit",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.ac_unit,
                      size: 22.0,
                    ),
                  ),
                  items: unittype.map((String unittype) {
                    return DropdownMenuItem(
                      value: unittype,
                      child: Text(unittype),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    _addproductauthcontroller.addproductmodel.productunit =
                        newValue;
                    setState(() {
                      _unit = newValue!;
                    });
                  },
                ),
                SizedBox(
                  height: 50 * MediaQuery.of(context).size.height * 0.001,
                ),
                TextFormField(
                  controller: _rate,
                  validator: (String? item) {
                    _addproductauthcontroller.addproductmodel.productrate =
                        item;
                    if (item!.isEmpty) {
                      return "Choose Product Rate";
                    }
                    return null;
                  },
                  onSaved: (_rate) {
                    _addproductauthcontroller.addproductmodel.productrate =
                        _rate;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.rate_review_sharp),
                    hintText: "Enter Product Rate",
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50 * MediaQuery.of(context).size.height * 0.001,
                ),
                TextFormField(
                  controller: _quantity,
                  validator: (String? item) {
                    _addproductauthcontroller.addproductmodel.productquantity =
                        item;
                    if (item!.isEmpty) {
                      return "Choose Product Quantity";
                    }
                    return null;
                  },
                  onSaved: (_quantity) {
                    _addproductauthcontroller.addproductmodel.productquantity =
                        _quantity;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.production_quantity_limits_sharp),
                    hintText: "Enter Product Quantity",
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50 * MediaQuery.of(context).size.height * 0.001,
                ),
                button(),
                // SizedBox(
                //   height: 50 * MediaQuery.of(context).size.height * 0.001,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey.withOpacity(0.65),
          ),
          child: MaterialButton(
            onPressed: () {
              _isLoading = true;
              _addproductauthcontroller.addproductsubmit(context);

              // print(_addproductauthcontroller.addproductmodel.producttype);
            },
            child: AutoSizeText("Add Product"),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey.withOpacity(0.65),
          ),
          child: MaterialButton(
            onPressed: (){
              setState(() {
                _addproductauthcontroller.addproductreset();
                // cleartext();
              });
            },
            child: AutoSizeText("Reset Details"),
          ),
        ),
      ],
    );
  }
}
