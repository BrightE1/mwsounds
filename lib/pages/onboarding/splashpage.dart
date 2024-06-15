import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:playrx/pages/onboarding/email.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => EnterEmailPage()));
    });

    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Iconsax.play,
              size: 50,
            ),
            // Replace with your logo
          ),
        ],
      ),
    );
  }
}
