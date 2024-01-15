import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Row(children: [
      HalfScreen(
        title: "DOCTORS",
        description: "Start your telemedicine practice with just one click!",
        color: Colors.brown,
        screenWidth: screenWidth,
        imageURL:
            "https://images.unsplash.com/photo-1526256262350-7da7584cf5eb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
      ),
      HalfScreen(
        title: "PATIENTS",
        description: "Start seeing your doctor and future appointments!",
        color: Colors.orange,
        screenWidth: screenWidth,
        imageURL:
            "https://t3.ftcdn.net/jpg/02/95/62/26/360_F_295622684_TQ33iAp7NQd9WZkxBq32x1qq5UoJIjRc.jpg",
      ),
    ]);
  }
}

class HalfScreen extends StatelessWidget {
  const HalfScreen(
      {Key? key,
      required this.screenWidth,
      required this.imageURL,
      required this.color,
      required this.title,
      required this.description})
      : super(key: key);

  final double screenWidth;
  final String imageURL;
  final Color color;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          image: NetworkImage(this.imageURL),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              this.title,
              style: TextStyle(
                  letterSpacing: 4.0,
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.description,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            // ElevatedButton(
            //   style: ButtonStyle(
            //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(8.0),
            //           side: BorderSide(color: this.color),
            //         ),
            //       ),
            //       elevation: MaterialStateProperty.all(0.0),
            //       shadowColor: MaterialStateProperty.all(this.color),
            //       backgroundColor: MaterialStateProperty.all(this.color)),
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/login');
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Text("Login"),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
