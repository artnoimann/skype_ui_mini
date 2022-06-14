import 'package:flutter/material.dart';
import 'package:skype_static_ui/model/chat_user.dart';

ChatCardList(List<ChatUsersModel> chatUsers, int index, Function? toDetailChat()){
  return InkWell(
    onTap: toDetailChat,
    child: Card(
      elevation: 0,
      child: ListTile(
        leading: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                chatUsers[index].avatar,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    border:
                    Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(30.0),
                    color: chatUsers[index].online ? Colors.green : Colors.red),
              ),
            ),
          ],
        ),
        title: Text(chatUsers[index].name),
        subtitle: Text(chatUsers[index].lastMessage),
        trailing: Text(
          chatUsers[index].time,
          style: TextStyle(fontSize: 9, color: Colors.grey),
        ),
      ),
    ),
  );
}