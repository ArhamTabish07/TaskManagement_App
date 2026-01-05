import 'package:flutter/material.dart';
import 'package:task_management_app/core/service/navigation_service.dart';
import 'package:task_management_app/nav_bar/Message/GroupChat/views/group_chat_screen.dart';
import 'package:task_management_app/nav_bar/Message/GroupChat/widgets/group_message_card.dart';
import 'package:task_management_app/nav_bar/Message/chat_constants.dart';

class GroupChatTab extends StatelessWidget {
  const GroupChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GroupMessageCard(
          conversationId: ChatConstants.publicConversationId,
          title: ChatConstants.publicConversationTitle,
          onTap: () {
            NavigationService().navigateToScreen(
              nextScreen: const GroupChatScreen(
                conversationId: ChatConstants.publicConversationId,
                title: ChatConstants.publicConversationTitle,
              ),
            );
          },
        ),
      ],
    );
  }
}
