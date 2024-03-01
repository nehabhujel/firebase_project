import 'package:firebase_project/auth/service/auth_service.dart';
import 'package:firebase_project/common/common_button.dart';
import 'package:firebase_project/common/common_dialog.dart';
import 'package:firebase_project/common/common_textfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static const String routeName = "/signup_screen";
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  void singUpUser() {
    showDialogBox(context: context, text: "Please wait....");
    authService.registerUser(
        context: context,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phoneNumber: phoneNumberController.text.trim());
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
        title: const Text("Sign Up Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextField(
                      controller: nameController,
                      hintText: " Name",
                      icon: Icons.person),
                  const SizedBox(
                    height: 15,
                  ),

                  CommonTextField(
                      controller: emailController,
                      hintText: "Email",
                      icon: Icons.email),
                  const SizedBox(
                    height: 15,
                  ),
                  CommonTextField(
                      obscureText: true,
                      controller: passwordController,
                      hintText: "Password",
                      icon: Icons.key),
                  const SizedBox(
                    height: 15,
                  ),

                  CommonTextField(
                      keyBoardType: TextInputType.phone,
                      controller: phoneNumberController,
                      hintText: "Contact",
                      icon: Icons.call),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CommonbButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          singUpUser();
                        }
                      },
                      text: "Sign Up"),
                  const SizedBox(
                    height: 15,
                  ),
                  // CommonbButton(
                  //     onTap: () {
                  //       Navigator.pushNamed(context, 'home_screen');
                  //     },
                  //     text: " Go to Login Page"),
                ],
              ),
            )),
      ),
    );
  }
}
