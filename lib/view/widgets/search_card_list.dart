import 'package:flutter/material.dart';
import 'package:skype_static_ui/model/chat_user.dart';

SearchCardList (List<ChatUsersModel> chatUsers, int index, Function? toDetailChat()) {
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
          ],
        ),
        title: Text(chatUsers[index].name),
      ),
    ),
  );
}