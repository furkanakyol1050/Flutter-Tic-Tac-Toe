import 'package:flutter/material.dart';
import 'package:tictactoe/homepage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selection = 0;
  List selectionBackground = [
    const Color.fromRGBO(158, 118, 118, 0.3),
    const Color.fromRGBO(158, 118, 118, 0.1),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 248, 234, 1),
      body: Column(
        children: [
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 80),
                  child: Text(
                    "Tic Tac Toe",
                    style: TextStyle(
                      color: Color.fromRGBO(89, 69, 69, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                ),
                Text(
                  "Choose First Player",
                  style: TextStyle(
                    color: Color.fromRGBO(89, 69, 69, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    selection = 0;
                    setState(
                      () {},
                    );
                  },
                  child: Container(
                    width: size.width / 2.3,
                    decoration: BoxDecoration(
                      color: selectionBackground[selection % 2],
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "X",
                      style: TextStyle(
                        color: Color.fromRGBO(89, 69, 69, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 140,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selection = 1;
                    setState(() {});
                  },
                  child: Container(
                    width: size.width / 2.3,
                    decoration: BoxDecoration(
                      color: selectionBackground[(selection + 1) % 2],
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "O",
                      style: TextStyle(
                        color: Color.fromRGBO(89, 69, 69, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 140,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(data: selection),
                    ),
                  );
                },
                child: const Text(
                  "Play",
                  style: TextStyle(
                    color: Color.fromRGBO(89, 69, 69, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
