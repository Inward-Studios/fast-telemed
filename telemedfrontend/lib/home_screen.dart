import 'package:flutter/material.dart';
import 'package:telemedfrontend/about_page.dart';
import 'package:telemedfrontend/home_page.dart';
import 'package:telemedfrontend/login_page.dart';

import 'constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageNum = 0;
  List<Widget> _pages = [
    HomePage(),
    AboutPage(),
    LoginPage(
      showRegisterPage: () {},
    ),
  ];

  void set_page(int pageTapped) {
    setState(() {
      pageNum = pageTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getMyAppBar(context),
      body: HomePage(),
    );
  }
}

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
