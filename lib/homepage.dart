import 'package:flutter/material.dart';
import 'package:tictactoe/areas.dart';

class HomePage extends StatefulWidget {
  final int data;

  const HomePage({super.key, required this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selection = 0;
  var xPlayerPoint = 0;
  var oPlayerPoint = 0;

  List playerBackground = [
    const Color.fromRGBO(158, 118, 118, 0.3),
    const Color.fromRGBO(158, 118, 118, 0.1),
  ];

  List xoLocation = List.generate(9, (index) => '');

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < xoLocation.length; i++) {
      xoLocation[i] = '';
    }
    xPlayerPoint = 0;
    oPlayerPoint = 0;
    selection = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 248, 234, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TopPlayer(
            playerBackground: playerBackground,
            selection: selection,
            xPlayerPoint: xPlayerPoint,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.height / 2,
            child: GridView.builder(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: GestureDetector(
                    onTap: () {
                      if (xoLocation[index] == '') {
                        if (selection == 0) {
                          xoLocation[index] = 'X';
                        } else {
                          xoLocation[index] = 'O';
                        }
                        if (!xoLocation.contains('')) {
                          alertDialogMethod(context, "Friendship");
                          for (int i = 0; i < xoLocation.length; i++) {
                            xoLocation[i] = '';
                          }
                        } else if (winControl()) {
                          alertDialogMethod(context,
                              selection == 0 ? "X Player" : "O Player");
                          selection == 0
                              ? xPlayerPoint += 1
                              : oPlayerPoint += 1;
                          for (int i = 0; i < xoLocation.length; i++) {
                            xoLocation[i] = '';
                          }
                        }
                        selection = (selection + 1) % 2;
                        setState(() {});
                      }
                    },
                    child: MyArea(text: xoLocation[index]),
                  ),
                );
              },
            ),
          ),
          BottomPlayer(
              playerBackground: playerBackground,
              selection: selection,
              oPlayerPoint: oPlayerPoint),
        ],
      ),
    );
  }

  Future<void> alertDialogMethod(BuildContext context, String variable) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(255, 248, 234, 1),
          title: Center(
            child: Text(
              '$variable is WON',
              style: const TextStyle(
                color: Color.fromRGBO(89, 69, 69, 1),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        );
      },
    );
  }

  bool winControl() {
    String variable = selection == 0 ? "X" : "O";
    List<List<int>> controlList = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var element in controlList) {
      if (xoLocation[element[0]] == variable &&
          xoLocation[element[1]] == variable &&
          xoLocation[element[2]] == variable) {
        return true;
      }
    }
    return false;
  }
}

class TopPlayer extends StatelessWidget {
  const TopPlayer({
    super.key,
    required this.playerBackground,
    required this.selection,
    required this.xPlayerPoint,
  });

  final List playerBackground;
  final int selection;
  final int xPlayerPoint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, bottom: 50, top: 50),
        child: Container(
          decoration: BoxDecoration(
            color: playerBackground[selection % 2],
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: const Border.fromBorderSide(
                    BorderSide(
                      width: 5,
                      color: Color.fromRGBO(129, 91, 91, 1),
                    ),
                  ),
                ),
                child: Text(
                  xPlayerPoint.toString(),
                  style: const TextStyle(
                    color: Color.fromRGBO(89, 69, 69, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const Text(
                "X  Player",
                style: TextStyle(
                  color: Color.fromRGBO(89, 69, 69, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomPlayer extends StatelessWidget {
  const BottomPlayer({
    super.key,
    required this.playerBackground,
    required this.selection,
    required this.oPlayerPoint,
  });

  final List playerBackground;
  final int selection;
  final int oPlayerPoint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, bottom: 50, top: 50),
        child: Container(
          decoration: BoxDecoration(
            color: playerBackground[(selection + 1) % 2],
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "O  Player",
                style: TextStyle(
                  color: Color.fromRGBO(89, 69, 69, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: const Border.fromBorderSide(
                    BorderSide(
                      width: 5,
                      color: Color.fromRGBO(129, 91, 91, 1),
                    ),
                  ),
                ),
                child: Text(
                  oPlayerPoint.toString(),
                  style: const TextStyle(
                    color: Color.fromRGBO(89, 69, 69, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
