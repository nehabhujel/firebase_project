import 'package:firebase_project/auth/screen/signup_screen.dart';
import 'package:firebase_project/auth/service/auth_service.dart';
import 'package:firebase_project/common/common_button.dart';
import 'package:firebase_project/common/common_dialog.dart';
import 'package:firebase_project/common/common_textfield.dart';
import 'package:firebase_project/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/home_screen";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginPage> {
  final AuthService authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void singUpUser() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showSnackBar(context, "Please enter all the required fields");
    } else {
      showDialogBox(context: context, text: "Loggin in.....");
      authService.loginUser(
          context: context,
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                // margin:EdgeInsets.all(20),
                //  padding:EdgeInsets.all(20),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/flutter.png"),
                        height: 100,
                        width: 100,
                      ),
                      Text(
                        "Flutter",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  CommonTextField(
                      controller: emailController,
                      hintText: "email",
                      icon: Icons.email),
                  CommonTextField(
                      obscureText: true,
                      controller: passwordController,
                      hintText: "password",
                      icon: Icons.key),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonbButton(
                    onTap: () {
                      singUpUser();
                      //print("hello");

                      // Navigator.pushNamed(
                      //   context,
                      //   MultipleValueScreen.routeName,
                      //   arguments: {
                      //     "childText": "hello how are you",
                      //     "titleText": "Title"
                      //   },
                      // );

                      // if (!formKey.currentState!.validate()) {}
                    },
                    text: "Login ",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forget Password",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("New user?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          "Create a new Account",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//   void login() {
//     if (emailController.text != "karsangmagar19@gmail.com") {
//       showSnackBar(context, "Incorect Email");
//     } else if (passwordController.text != "12345") {
//       showSnackBar(context, "Incorrect password");
//     } else {
//       showSnackBar(context, "Successfully logged in");
//     }
//   }
// }
}
