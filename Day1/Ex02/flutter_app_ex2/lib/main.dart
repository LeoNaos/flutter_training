
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ex 02',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.pink[400]),
      child: Row(
        children: [
          Expanded(
            flex: 50,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: buildStackFirstBlock(),
                ),
                Expanded(
                  flex: 1,
                  child: buildStackSecondBlock(),
                ),
                Expanded(
                  flex: 1,
                  child: buildStackThirdBlock(),
                ),
                Expanded(
                  flex: 1,
                  child: buildStackFourthBlock(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              color: Colors.pink[400],
            ),
          ),
        ],
      ),
    );
  }

  /// Third Block
  Stack buildStackThirdBlock() {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.yellow,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.pink[400],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.pink[400],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 18,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.black45,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.pink[400],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.pink[400],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  /// Second Block
  Stack buildStackSecondBlock() {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.pink[400],
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Fourth Block
  Stack buildStackFourthBlock() {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.pink[400],
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// First Block
  Stack buildStackFirstBlock() {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: buildViewOnFirstBlock(),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.pink[400],
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// on First Block
  Column buildViewOnFirstBlock() {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.orange,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.lightBlueAccent,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.pink[400],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.lightBlueAccent,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

