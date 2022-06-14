import 'package:flutter/material.dart';
import 'package:skype_static_ui/data/chat_list.dart';
import 'package:skype_static_ui/view/screens/search_screen.dart';
import 'package:skype_static_ui/view/widgets/call_card_list.dart';

import 'chat_screen.dart';

class CallsListScreen extends StatefulWidget {
  const CallsListScreen({Key? key}) : super(key: key);

  @override
  State<CallsListScreen> createState() => _CallsListScreenState();
}

class _CallsListScreenState extends State<CallsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Calls',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.videocam_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.add_ic_call,
              color: Colors.black,
              size: 22,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                    filled: true,
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: chatUsers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CallCardList(chatUsers, index, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blue.shade200],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: Icon(Icons.settings_phone),
        ),
      ),
    );
  }
}
