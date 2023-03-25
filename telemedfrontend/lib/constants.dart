import 'package:flutter/material.dart';

class NavbarButton extends StatelessWidget {
  NavbarButton({
    Key? key,
    required this.txt,
    required this.state_setter,
  }) : super(key: key);

  late String txt;
  late void Function() state_setter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: GestureDetector(
          onTap: state_setter,
          child: Text(
            txt,
            style: TextStyle(
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}

AppBar getMyAppBar(dynamic context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.brown.shade300,
    leading: Center(
      child: Text(
        "NAME",
        style: TextStyle(fontSize: 14),
      ),
    ),
    actions: [
      NavbarButton(
          txt: "HOME",
          state_setter: () {
            Navigator.pushNamed(context, "/home");
          }),
      NavbarButton(
          txt: "ABOUT",
          state_setter: () {
            Navigator.pushNamed(context, "/about");
          }),
      NavbarButton(
          txt: "LOGIN",
          state_setter: () {
            Navigator.pushNamed(context, "/login");
          }),
    ],
  );
}

double getTitle(context) {
  double height = MediaQuery.of(context).size.height;
  return height * 0.04;
}

double geth1(context) {
  double height = MediaQuery.of(context).size.height;
  return height * 0.02;
}

double geth2(context) {
  double height = MediaQuery.of(context).size.height;
  return height * 0.015;
}
