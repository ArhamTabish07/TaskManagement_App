import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/core/components/text_style.dart';
import 'package:task_management_app/core/components/white_container.dart';
import 'package:task_management_app/core/constant/color_constant.dart';
import 'package:task_management_app/core/constant/icon_constant.dart';
import 'package:task_management_app/nav_bar/Message/GroupChat/provider/chat_provider.dart';

class GroupMessageCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String conversationId;
  final String title;

  const GroupMessageCard({
    super.key,
    required this.conversationId,
    required this.title,
    this.onTap,
  });

  String _formatTime(Timestamp? ts) {
    if (ts == null) return '';
    final dt = ts.toDate();
    final h = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final m = dt.minute.toString().padLeft(2, '0');
    final ampm = dt.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $ampm';
  }

  @override
  Widget build(BuildContext context) {
    final chat = context.read<ChatProvider>();

    return GestureDetector(
      onTap: onTap,
      child: WhiteContainer(
        height: 110,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: chat.streamConversation(conversationId),
            builder: (context, snapshot) {
              // defaults
              String previewText = 'No messages yet';
              String time = '';

              if (snapshot.hasError) {
                previewText = 'Unable to load';
              } else if (snapshot.hasData && snapshot.data != null) {
                final doc = snapshot.data!;
                final data = doc.data() ?? {};

                final lastMessage = (data['lastMessage'] ?? '').toString();
                final lastSenderName = (data['lastSenderName'] ?? '')
                    .toString();

                if (lastMessage.trim().isEmpty) {
                  previewText = 'No messages yet';
                } else {
                  previewText = lastSenderName.trim().isEmpty
                      ? lastMessage
                      : '$lastSenderName: $lastMessage';
                }

                time = _formatTime(data['lastMessageAt'] as Timestamp?);
              }

              return Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        IconConstants.defaultgrouplogo,
                        width: 56,
                        height: 56,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: primaryTextStyle(
                                      color: ColorConstant.black,
                                      size: 16,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  time,
                                  style: primaryTextStyle(
                                    color: ColorConstant.grey,
                                    size: 12,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    previewText,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: primaryTextStyle(
                                      color: ColorConstant.darkgrey,
                                      size: 14,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
