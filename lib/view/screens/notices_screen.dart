import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoticesScreen extends StatelessWidget {
  const NoticesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notices',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.settings,
              color: Colors.black,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.videocam_outlined,
              color: Colors.black,
              size: 22,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                'https://assets6.lottiefiles.com/packages/lf20_ucsyy44s.json'),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  'There are no new notifications here',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                'Go here to see new mentions of you, quotes and more.',
                style: TextStyle(
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
