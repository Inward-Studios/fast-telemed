import 'package:flutter/material.dart';
import 'package:telemedfrontend/myElevatedButton.dart';
import 'package:telemedfrontend/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  LoginPage({required this.showRegisterPage, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  double getHoverElevation(Set<MaterialState> state) {
    Set<MaterialState> states = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused
    };

    if (state.any(states.contains)) {
      return 5;
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
      return Colors.green.shade400;
    }
    return Colors.brown.shade400;
  }

  void handleLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            "Oops! There's something wrong with your email or password. Check again!"),
      ),
    );
  }

  void handleForgotPassowrd() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Sorry, we dont handle that yet!",
        ),
      ),
    );
  }

  void handleSignUpRedirect() {
    Navigator.pushNamed(context, "/signup");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[150],
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
                left: screenWidth > 750
                    ? (screenWidth * 0.2)
                    : (screenWidth * 0.1),
                right: screenWidth > 750
                    ? (screenWidth * 0.2)
                    : (screenWidth * 0.05)),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //hello
                  Text(
                    "Log In",
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

                  SizedBox(height: 45),
                  //email text field
                  MyTextField(
                      controller: _emailController,
                      hintText: "Email",
                      obscureText: false),

                  SizedBox(height: 20),

                  //password

                  MyTextField(
                      controller: _passwordController,
                      hintText: "Password",
                      obscureText: true),

                  SizedBox(height: 10),

                  //forgot password
                  GestureDetector(
                    onTap: handleForgotPassowrd,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.blue[700]),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30),
                  MyElevatedButton(
                      buttonText: "Log In", buttonFunction: handleLogin),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[600],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text("Or continue with"),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  //dont have an account? sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      GestureDetector(
                        onTap: handleSignUpRedirect,
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //google button
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
