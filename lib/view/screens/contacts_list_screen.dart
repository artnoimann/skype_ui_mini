import 'package:flutter/material.dart';
import 'package:skype_static_ui/data/chat_list.dart';
import 'package:skype_static_ui/utils/color_extension.dart';
import 'package:skype_static_ui/view/screens/chat_screen.dart';
import 'package:skype_static_ui/view/screens/search_screen.dart';
import 'package:skype_static_ui/view/widgets/contact_card_list.dart';

class ContactsListScreen extends StatefulWidget {
  const ContactsListScreen({Key? key}) : super(key: key);

  @override
  State<ContactsListScreen> createState() => _ContactsListScreenState();
}

class _ContactsListScreenState extends State<ContactsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Contacts',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
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
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      color: "#F1F1F3".toColor(),
                    ),
                    child: Icon(
                      Icons.filter_alt,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.group_add,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    'Go into your contact settings to set up who can see you in Skype and search.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8.0),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      color: "#F1F1F3".toColor(),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.black45,),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: chatUsers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ContactCardList(chatUsers, index, () {
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
          child: Icon(Icons.person_add_alt_1_outlined),
        ),
      ),
    );
  }
}
