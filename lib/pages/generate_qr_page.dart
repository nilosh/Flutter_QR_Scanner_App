import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_app/main.dart';

class GenerateQrPage extends StatefulWidget {
  @override
  _GenerateQrPageState createState() => _GenerateQrPageState();
}

class _GenerateQrPageState extends State<GenerateQrPage> {

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BarcodeWidget(
                barcode: Barcode.qrCode(),
                color: Colors.black,
                data: _textEditingController.text ?? 'Hello World!',
                width: 200.0,
                height: 200.0,
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(context),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.done,
                    size: 30.0,
                    ),
                    onPressed: () => setState(() {}),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) => TextField(
    controller: _textEditingController,
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 20.0,
    ),
    decoration: InputDecoration(
      hintText: 'Enter the data.',
      hintStyle: TextStyle(
        fontWeight: FontWeight.w200,
        color: Colors.black45,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );
}
