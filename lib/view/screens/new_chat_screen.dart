import 'package:flutter/material.dart';
import 'package:skype_static_ui/data/chat_list.dart';
import 'package:skype_static_ui/data/new_chat_action_list.dart';
import 'package:skype_static_ui/view/screens/chat_screen.dart';
import 'package:skype_static_ui/view/screens/search_screen.dart';
import 'package:skype_static_ui/view/widgets/new_chat_card_list.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: Text(
          'New chat',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
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
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                    filled: true,
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shrinkWrap: true,
              itemCount: actionListNewChat.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Row(
                    children: [
                      Icon(
                        actionListNewChat[index].iconAction,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        actionListNewChat[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10,),
              child: Text(
                'Recommended',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shrinkWrap: true,
              itemCount: chatUsers.length,
              itemBuilder: (context, index) {
                return NewChatCard(chatUsers, index, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ),
                  );
                });
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
