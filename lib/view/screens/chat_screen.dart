import 'package:flutter/material.dart';
import 'package:skype_static_ui/data/chat_detail_message_list.dart';
import 'package:skype_static_ui/utils/color_extension.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
        title: Row(
          children: [
            Stack(
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
                            color: Colors.green))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Master of puppets',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Deep work',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blue.shade200],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: Icon(
                Icons.videocam_outlined,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blue.shade200],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: Icon(
                Icons.add_ic_call,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Align(
                    alignment: messageList[index].author == 'sender'
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: messageList[index].author == 'sender'
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          messageList[index].time,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: messageList[index].author == 'sender'
                                ? "DDF3FE".toColor()
                                : "F3F5FB".toColor(),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Text(messageList[index].message),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10),
            child: Row(
        children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                bottom: 10,
              ),
            ),
            InkWell(
              child: Container(
                width: 35,
                height: 35,
                padding: EdgeInsets.only(
                  left: 10,
                  top: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue.shade200],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                child: Text(
                  '+',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              height: 32,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(7.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    suffixIcon: IconButton(
                      padding: EdgeInsets.only(bottom: 1),
                      icon: Icon(Icons.tag_faces, size: 25,),
                      color: Colors.black38,
                        onPressed: () => print('suffixIcon pressed')
                    ),
                    filled: true,
                    hintText: ' Enter the message',
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => print('print micro'),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(Icons.mic, color: Colors.black38,),
              ),
            ),
            InkWell(
              onTap: () => print('print camera'),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(Icons.camera_alt, color: Colors.black38,),
              ),
            ),
        ],
      ),
          )),
    );
  }
}
