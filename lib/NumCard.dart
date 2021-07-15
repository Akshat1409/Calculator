import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  final String text;
  final Color colour;
  NumberCard({this.text, this.colour, this.done});
  final Function done;
  void dne() {
    done(text);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff252D38),
      shadowColor: Colors.white24,
      elevation: 25.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.zero, // <-- Add this
          padding: EdgeInsets.symmetric(
              vertical: 25, horizontal: 30.0), // <-- and this
        ),
        onPressed: dne,
        child: Text(
          text,
          style: TextStyle(fontSize: 23, color: colour),
        ),
      ),
    );
  }
}
