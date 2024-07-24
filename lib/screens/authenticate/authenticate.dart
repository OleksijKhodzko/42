import 'package:flutter/material.dart';
import 'package:fortytwo/screens/authenticate/sign_in.dart';
import 'package:fortytwo/screens/authenticate/sign_up.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        controller: controller,
        itemBuilder: (context, index) {
          if (index == 0) {
            return LoginScreen(
              controller: controller,
            );
          } else {
            // if (index == 1) {
            return SignUpScreen(
              controller: controller,
            );
          }
          // else {
          //   return VerifyScreen(
          //     controller: controller,
          //   );
          // }
        },
      ),
    );
  }
}
