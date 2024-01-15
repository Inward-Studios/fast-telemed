import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:emojis/emojis.dart'; // to use Emoji collection
import 'package:emojis/emoji.dart';
import 'package:ms_undraw/ms_undraw.dart'; // to use Emoji utilities

class DoctorSignup extends StatefulWidget {
  const DoctorSignup({super.key});

  @override
  State<DoctorSignup> createState() => _DoctorSignupState();
}

class _DoctorSignupState extends State<DoctorSignup> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  int _index = 0;
  int whichSelected = 0;

  List<UnDraw> doctorPatientIllustrations = [
    UnDraw(
      color: Colors.brown.shade400,
      illustration: UnDrawIllustration.doctors,
    ),
    UnDraw(
      color: Colors.brown.shade400,
      illustration: UnDrawIllustration.a_day_at_the_park,
    )
  ];

  final Map<String, String> stepImageSelectors = {
    "Step 1": "Something",
  };

  Widget whichStep2() {
    print(whichSelected);
    if (whichSelected == 0) {
      return MyForm(
        formKey: _formKey2,
        fieldInfo: {
          "First Name": Icons.person_outline,
          "Last Name": Icons.person_outline,
          "Email": Icons.email_outlined,
          "Practice Name": Icons.local_hospital_outlined,
        },
      );
    } else {
      return MyForm(
        formKey: _formKey2,
        fieldInfo: {
          "First Name": Icons.person_outline,
          "Last Name": Icons.person_outline,
          "Email": Icons.email_outlined,
        },
      );
    }
  }

  Widget whichIllustration(int stepperIndex) {
    List<UnDraw> undrawIllustrations = [
      UnDraw(
        color: Colors.brown.shade400,
        illustration: UnDrawIllustration.doctor,
      ),
      doctorPatientIllustrations[whichSelected],
      UnDraw(
        color: Colors.brown.shade400,
        illustration: UnDrawIllustration.forms,
      )
    ];
    return undrawIllustrations[stepperIndex];
  }

  @override
  Widget build(BuildContext context) {
    double stepperWidth = MediaQuery.of(context).size.width * 0.1;
    double stepperHeight = MediaQuery.of(context).size.height * 0.1;
    var column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //hello
        Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        SizedBox(height: 15),
        Text(
          "Appointments - faster and easier",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 35),
        Stepper(
          margin: EdgeInsets.only(left: stepperWidth),
          type: StepperType.vertical,
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            print(_index);
            if (_index <= 1) {
              setState(() {
                _index += 1;
              });
            } else if (_index == 2) {
              print("The Selected is ");
              print(whichSelected);
              if (whichSelected == 1) {
                Navigator.pushNamed(context, '/patient_dashboard');
              } else {
                Navigator.pushNamed(context, '/doctor_dashboard');
              }
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <Step>[
            Step(
                title: const Text('Are you a doctor or a patient? '),
                content: Form(
                  key: _formKey1,
                  child: Row(
                    children: [
                      MyOutlinedButton(0, "I'm a Doctor"),
                      SizedBox(
                        width: 20,
                      ),
                      MyOutlinedButton(1, "I'm a Patient"),
                    ],
                  ),
                )),
            Step(
              title: const Text('Basic Information'),
              content: whichStep2(),
            ),
            Step(
              title: Text('Username and Password'),
              content: MyForm(
                formKey: _formKey3,
                fieldInfo: {
                  "Username": Icons.person_outline,
                  "Password": Icons.person_outline,
                },
              ),
            ),
          ],
        ),
      ],
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0),
          // padding: EdgeInsets.only(
          //     left: stepperWidth, right: stepperWidth, top: stepperHeight),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    child: column),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height,
                  child: whichIllustration(_index))
            ],
          ),
          //MyForm(formKey: _formKey),
        ),
      ),
    );
  }

  ElevatedButton MyOutlinedButton(int selection, String tag) {
    Color selectedColor = Colors.brown.shade400;
    Color unselectedColor = Colors.grey.shade500;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(18),
          elevation: 0,
          backgroundColor:
              whichSelected == selection ? selectedColor : Colors.white,
          foregroundColor:
              whichSelected == selection ? Colors.white : unselectedColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1, // thickness
                  color: whichSelected == selection
                      ? selectedColor
                      : unselectedColor // color
                  ),
              // border radius
              borderRadius: BorderRadius.circular(5))),
      onPressed: () {
        setState(() {
          whichSelected = selection;
        });
      },
      child: Text(tag),
    );
  }
}

class MyForm extends StatelessWidget {
  MyForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required Map<String, IconData> fieldInfo,
  })  : _formKey = formKey,
        _fieldInfo = fieldInfo,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final Map<String, IconData> _fieldInfo;

  List<Widget> getWidgets() {
    List<Widget> formFields = [];
    _fieldInfo.forEach((key, value) {
      formFields.add(myTextFormField(labelText: key, iconUsed: value));
    });
    return formFields;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: getWidgets(),
      ),
    );
  }
}

class myTextFormField extends StatelessWidget {
  myTextFormField({
    Key? key,
    required this.labelText,
    required this.iconUsed,
  }) : super(key: key);

  IconData iconUsed;
  String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, top: 5),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            this.iconUsed,
            color: Colors.brown.shade400,
          ),
          labelText: this.labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown.shade400),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[100]),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
