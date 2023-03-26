import 'package:flutter/material.dart';
import 'package:telemedfrontend/constants.dart';

class InfoCard extends StatefulWidget {
  InfoCard({
    Key? key,
    required this.name,
    required this.moreInfo,
    required this.dateInfo,
    required this.zoomLink,
  }) : super(key: key);

  String name;
  String moreInfo; //Doctype for the doctor, address for the patient
  String dateInfo;
  String zoomLink;
  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.1),
        //     spreadRadius: 2,
        //     blurRadius: 7,
        //     offset: Offset(5, 6), // changes position of shadow
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.name,
            style: TextStyle(
              fontSize: geth1(context),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.moreInfo,
            style: TextStyle(fontSize: geth2(context)),
          ),
          Text(
            widget.dateInfo,
            style: TextStyle(fontSize: geth2(context)),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              ActionButton(
                buttonIcon: Icons.arrow_forward,
                buttonColor: Colors.green,
                onTapFxn: () {},
              ),
              ActionButton(
                buttonIcon: Icons.edit,
                onTapFxn: () {},
                buttonColor: Colors.amber,
              ),
              ActionButton(
                buttonIcon: Icons.delete,
                buttonColor: Colors.red,
                onTapFxn: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  ActionButton({
    Key? key,
    required this.buttonIcon,
    required this.buttonColor,
    required this.onTapFxn,
  }) : super(key: key);

  IconData buttonIcon;
  MaterialColor buttonColor;
  void Function() onTapFxn;

  Set<MaterialState> states = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused
  };

  Color getBackgroundColor(Set<MaterialState> state) {
    if (state.any(states.contains)) {
      return this.buttonColor[800]!;
    }
    return Colors.brown.shade400;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: this.onTapFxn,
        child: Icon(
          this.buttonIcon,
          size: 16,
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
            elevation: MaterialStateProperty.all(0),
            backgroundColor:
                MaterialStateProperty.resolveWith(getBackgroundColor),
            foregroundColor: MaterialStateProperty.all(Colors.white)),
      ),
    );
  }
}
