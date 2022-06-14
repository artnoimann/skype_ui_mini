import 'package:flutter/material.dart';
import 'package:skype_static_ui/model/chat_action.dart';

List<ChatAction> actionListNewChat = [
  ChatAction(name: 'Fact videocall', iconAction: Icons.videocam_outlined,),
  ChatAction(name: 'New group chat', iconAction: Icons.group_add),
  ChatAction(name: 'New call', iconAction: Icons.call),
  ChatAction(name: 'New chat with moderator', iconAction: Icons.add_moderator),
  ChatAction(name: 'New privat chat', iconAction: Icons.private_connectivity),
];