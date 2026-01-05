import 'package:flutter/material.dart';
import 'package:task_management_app/nav_bar/Message/DirectChat/widgets/direct_message_card.dart';

class DirectChatTab extends StatelessWidget {
  const DirectChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [DirectMessageCard()]));
  }
}
