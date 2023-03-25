import 'package:flutter/material.dart';

class MyElevatedButton extends StatefulWidget {
  MyElevatedButton({
    Key? key,
    required this.buttonText,
    required this.buttonFunction,
  }) : super(key: key);

  String buttonText;
  void Function() buttonFunction;
  @override
  _MyElevatedButtonState createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {
  double getHoverElevation(Set<MaterialState> state) {
    Set<MaterialState> states = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused
    };

    if (state.any(states.contains)) {
      return 10;
    }
    return 0;
  }

  Color getHoverColor(Set<MaterialState> state) {
    Set<MaterialState> states = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused
    };

    if (state.any(states.contains)) {
      return Colors.brown.shade600;
    }
    return Colors.brown.shade400;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Text(widget.buttonText),
      ),
      onPressed: widget.buttonFunction,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(getHoverColor),
        elevation: MaterialStateProperty.resolveWith(getHoverElevation),
      ),
    );
  }
}
