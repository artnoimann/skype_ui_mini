import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skype_static_ui/data/chat_list.dart';
import 'package:skype_static_ui/utils/color_extension.dart';
import 'package:skype_static_ui/view/screens/chat_screen.dart';
import 'package:skype_static_ui/view/screens/new_chat_screen.dart';
import 'package:skype_static_ui/view/screens/search_screen.dart';
import 'package:skype_static_ui/view/widgets/chat_card_list.dart';

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({Key? key}) : super(key: key);

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  String? _selectedOption;

  void newChatOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewChatScreen(),
      ),
    );
    print('new chat');
  }

  void _close(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  void _showSheet(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => CupertinoActionSheet(
              title: Text('Setting chats'),
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      setState(() {
                        _selectedOption = "Sort by date";
                      });
                      _close(ctx);
                    },
                    child: const Text('Sort by dage')),
                CupertinoActionSheetAction(
                    onPressed: () {
                      setState(() {
                        _selectedOption = "Sort by unread";
                      });
                      _close(ctx);
                    },
                    child: const Text('Sort by unread')),
                CupertinoActionSheetAction(
                    onPressed: () {
                      setState(() {
                        _selectedOption = "Sort by activity";
                      });
                      _close(ctx);
                    },
                    child: const Text('Sort by activity')),
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () => _close(ctx),
                child: const Text('Cancel'),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: AssetImage('assets/myavatar.jpg'),
                width: 40,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
              Icons.videocam_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Container(
                    width: 40,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      color: "#F1F1F3".toColor(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.filter_alt),
                      color: Colors.black38,
                      onPressed: () => _showSheet(context),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: chatUsers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ChatCardList(chatUsers, index, () {
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
        onPressed: () => newChatOpen(),
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
          child: Icon(Icons.add_comment_outlined),
        ),
      ),
    );
  }
}
