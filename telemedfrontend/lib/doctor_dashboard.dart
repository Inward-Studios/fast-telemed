import 'package:flutter/material.dart';
import 'package:telemedfrontend/constants.dart';
import 'package:telemedfrontend/info_card.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({Key? key}) : super(key: key);

  @override
  _DoctorDashboardState createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  List<InfoCard> doctorAppointments = [
    InfoCard(
      name: "John Doe",
      moreInfo: "1677 5th Ave, Lexington, NYC",
      dateInfo: "Monday, 10:00 AM",
      zoomLink: "something",
    )
  ];
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
                  "Doctor Dashboard",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 45,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("+ Create an Appointment"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(children: doctorAppointments),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
