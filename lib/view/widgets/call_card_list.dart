import 'package:flutter/material.dart';
import 'package:skype_static_ui/model/chat_user.dart';

CallCardList(List<ChatUsersModel> chatUsers, int index, Function? toDetailChat()) {
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
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
        title: Text(chatUsers[index].name),
        subtitle: Row(
          children: [
            Icon(
              Icons.phone_callback,
              color: Colors.grey,
              size: 13,
            ),
            Text('  ${chatUsers[index].time}'),
          ],
        ),
        trailing: Container(
          width: 70,
          child: Row(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 5.0),
                child: Icon(Icons.videocam_outlined),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 5.0),
                child: Icon(Icons.add_ic_call),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}