import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_scanner_app/pages/generate_qr_page.dart';
import 'package:qr_scanner_app/pages/scan_qr_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'QR Code Scanner';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainPage(title: title),
    );
  }
}

class MainPage extends StatefulWidget {

  final String title;

  const MainPage({Key key, @required this.title}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120.0,
              child: FlatButton(
                color: Colors.green,
                padding: const EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: Text('Create QR Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => GenerateQrPage()
                )),
              ),
            ),
            SizedBox(height: 30.0,),
            SizedBox(
              width: 120.0,
              child: FlatButton(
                padding: const EdgeInsets.all(10.0),
                color: Colors.lightGreen,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: Text('Scan QR Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ScanQrPage()
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

