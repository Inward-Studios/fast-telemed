import 'package:flutter/material.dart';
import 'package:telemedfrontend/constants.dart';
import 'package:telemedfrontend/info_card.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({Key? key}) : super(key: key);

  @override
  _PatientDashboardState createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  List<InfoCard> appointments = [
    InfoCard(
      name: "Dr.Patel",
      moreInfo: "Family Physician",
      dateInfo: "Monday, 10:00 AM",
      zoomLink: "something",
    )
  ];

  getAppointments() {
    //some function to get the appointments from backend/server
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getMyAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Patient Dashboard",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 45,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(children: appointments),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
