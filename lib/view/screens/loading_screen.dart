import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Lottie.network('https://assets7.lottiefiles.com/private_files/lf30_nat2qz3z.json'),
        // Image(
        //   width: 100,
        //   image: AssetImage('assets/skypelogo.png'),
        // ),
      ),
    );
  }
}
