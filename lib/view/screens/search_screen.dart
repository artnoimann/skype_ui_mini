import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:skype_static_ui/data/chat_list.dart';
import 'package:skype_static_ui/view/screens/chat_screen.dart';
import 'package:skype_static_ui/view/widgets/search_card_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        gradient: LinearGradient(
          colors: [Color(0xff0184dc), Color(0xff00b6f3)],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 20),
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: TextField(
              onChanged: (val) {},
              // cursorColor: UniversalVariables.blackColor,
              autofocus: true,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 35,
              ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {},
                ),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Color(0x88ffffff),
                ),
              ),
            ),
          ),
        ),
        flexibleSpace: Container(
          width: 30,
          child: Text(
            'Users',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black45,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 2,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  top: 10,
                ),
                child: Text(
                  'Users',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: chatUsers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SearchCardList(chatUsers, index, () {
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
    );
  }
}
