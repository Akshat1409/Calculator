import 'package:flutter/material.dart';
import 'package:calculator/NumCard.dart';
import 'Calculation.dart';

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  ScrollController controller = new ScrollController();
  List<Widget> lst = [];
  String val = "0";
  String txt = "";
  Text txt3(String add) {
    return Text(
      "$add",
      textAlign: TextAlign.end,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white24,
      ),
    );
  }

  void disp(String add) {
    setState(() {
      controller.jumpTo(controller.position.maxScrollExtent);
      if (txt.endsWith("+") ||
          txt.endsWith("/") ||
          txt.endsWith("-") ||
          txt.endsWith("x")) {
        if (add == ("+") ||
            add == ("/") ||
            add == "x" ||
            add == ("-") ||
            add == ("%")) {
          txt = txt.substring(0, txt.length - 1) + add;
          lst.removeLast();
          lst.add(txt3(add));
        } else {
          txt = txt + add;
          lst.add(txt3(add));
        }
      } else if (add == "C") {
        lst.clear();
        txt = "";
      } else {
        txt = txt + add;

        lst.add(txt3(add));
      }
    });

    print("$txt");
    if (add == "=") {
      setState(() {
        lst.removeLast();
        //txt = txt.substring(0, txt.length - 1);
        val = Calculate().calc(txt);
      });
    }
    print(lst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252D38),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 40,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "$val",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 55.0,
                        color: Colors.white,
                      ),
                    ),
                    /*Text(
                      "$txt",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 55.0,
                        color: Colors.white,
                      ),
                    ),*/
                    Flexible(
                      child: ListView.builder(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          itemCount: lst.length,
                          itemBuilder: (BuildContext context, int index) {
                            return lst[index];
                          }),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NumberCard(
                          text: 'C',
                          colour: Colors.white24,
                          done: disp,
                        ),
                        NumberCard(
                          text: '[',
                          colour: Colors.white24,
                          done: disp,
                        ),
                        NumberCard(
                          text: '%',
                          colour: Colors.white24,
                          done: disp,
                        ),
                        NumberCard(
                          text: '/',
                          colour: Colors.white24,
                          done: disp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NumberCard(
                          text: '7',
                          colour: Colors.white,
                          done: disp,
                        ),
                        NumberCard(
                          text: '8',
                          colour: Colors.white,
                          done: disp,
                        ),
                        NumberCard(
                          text: '9',
                          colour: Colors.white,
                          done: disp,
                        ),
                        NumberCard(
                          text: 'x',
                          colour: Colors.white24,
                          done: disp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NumberCard(
                          text: '4',
                          colour: Colors.white,
                          done: disp,
                        ),
                        NumberCard(
                          text: '5',
                          colour: Colors.white,
                          done: disp,
                        ),
                        NumberCard(
                          text: '6',
                          colour: Colors.white,
                          done: disp,
                        ),
                        NumberCard(
                          text: '-',
                          colour: Colors.white24,
                          done: disp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NumberCard(
                          text: '1',
                          colour: Colors.white,
                          done: disp,
                        ),
                        NumberCard(
                          text: '2',
                          colour: Colors.white,
                          done: disp,
                        ),
                        NumberCard(
                          text: '3',
                          colour: Colors.white,
                          done: disp,
                        ),
                        NumberCard(
                          text: '+',
                          colour: Colors.white24,
                          done: disp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NumberCard(
                          text: '0',
                          colour: Colors.white,
                          done: disp,
                        ),
                        NumberCard(
                          text: '.',
                          colour: Colors.white,
                          done: disp,
                        ),
                        NumberCard(
                          text: 'C',
                          colour: Colors.white24,
                          done: disp,
                        ),
                        NumberCard(
                          text: '=',
                          colour: Colors.white24,
                          done: disp,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
