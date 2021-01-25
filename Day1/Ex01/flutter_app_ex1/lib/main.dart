import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final celsController = TextEditingController();
  final fahrenController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _onChangeCToF(String text) {
    String fahrenheit = '';
    if(celsController.text.isNotEmpty) {
      fahrenheit = '${double.parse(celsController.text)* 1.8 +32}';
    }
    fahrenController.text = fahrenheit;
  }

  void _onChangeFToC(String text) {
    String celsius = '';
    if(fahrenController.text.isNotEmpty) {
      celsius = '${(double.parse(fahrenController.text)-32)/1.8}';
    }
    celsController.text = celsius;
  }

  @override
  void dispose() {
    celsController.dispose();
    fahrenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Input °C'
              ),
              controller: celsController,
              onChanged: _onChangeCToF,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Input °F'
              ),
              controller: fahrenController,
              onChanged: _onChangeFToC,
            ),
          ],
        ),
      ),
    );
  }
}
