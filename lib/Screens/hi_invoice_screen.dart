import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/API/Checkout_API.dart';
import 'package:marketapp/API/hi_pdf_invoice_api.dart';
import 'package:marketapp/API/login_API.dart';
import 'package:marketapp/API/pdf_api.dart';
import 'package:marketapp/API/pdf_invoice_api.dart';
import 'package:marketapp/Models/customer.dart';
import 'package:marketapp/Models/invoice.dart';
import 'package:marketapp/Models/supplier.dart';
import 'package:marketapp/Screens/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HIinvoicescreen extends StatefulWidget {
  const HIinvoicescreen({Key? key}) : super(key: key);

  @override
  State<HIinvoicescreen> createState() => _HIinvoicescreenState();
}

class _HIinvoicescreenState extends State<HIinvoicescreen> {
  List<InvoiceItem> invoicelist = [];
  String query = '';


  @override
  void initState() {
    checkoutapicall();
    Future.delayed(Duration(milliseconds: 900), () {
      pdffunct();
    });
    // TODO: implement initState
    super.initState();
  }

  Future checkoutapicall() async {
    final invoicelist = await Checkoutapi.checkoutpro(context, query);

    setState(() => this.invoicelist = invoicelist);
  }

  void pdffunct() async {
    final date = DateTime.now();
    final dueDate = date.add(Duration(days: 7));

    final invoice = Invoice(
      supplier: Supplier(
        name: '''Let'SBuy''',
        address: 'Bandhavgarh Colony, Satna, Madhya Pradesh',
        paymentInfo: '7723949581@apl',
      ),
      customer: Customer(
        name: '${Firstname} ${Lastname}',
        address: 'Satna, MP',
      ),
      info: InvoiceInfo(
        date: date,
        dueDate: dueDate,
        description: 'My description...',
        number: '${DateTime
            .now()
            .year}-9999',
      ),
      items: invoicelist,
    );

    // final pdfFile = await PdfInvoiceApi.generate(invoice);
    final pdfFile = await HIPdfInvoiceApi.higeneratepdf(invoice);

    PdfApi.openFile(pdfFile, context, query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText("Thank You, For the Shopping"),
            ElevatedButton(
              onPressed: ()  {
                setState(() {
                  // Navigator.of(context).pushReplacementNamed('/Homescreen');
                  // PersistentNavBarNavigator.pushNewScreen(
                  //   context,
                  //   screen: Homescreen(),
                  //   // withNavBar: true, // OPTIONAL VALUE. True by default.
                  //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  // );

                });
              },
              child: const AutoSizeText(
                "Back To Shopping",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
