import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/core/components/Header_card.dart';
import 'package:task_management_app/core/components/custom_icon_container.dart';
import 'package:task_management_app/core/components/gradient_container.dart';
import 'package:task_management_app/core/components/text_style.dart';
import 'package:task_management_app/core/constant/color_constant.dart';
import 'package:task_management_app/core/constant/icon_constant.dart';
import 'package:task_management_app/core/service/navigation_service.dart';
import 'package:task_management_app/nav_bar/Message/GroupChat/provider/chat_provider.dart';

class GroupChatScreen extends StatefulWidget {
  final String conversationId;
  final String title;

  const GroupChatScreen({
    super.key,
    required this.conversationId,
    required this.title,
  });

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // auto-create the public room if missing
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await context.read<ChatProvider>().ensurePublicRoom(
          widget.conversationId,
          widget.title,
        );
      } catch (e) {
        NavigationService().showToast("Chat permissions issue: $e");
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        body: Column(
          children: [
            Stack(
              children: [
                HeaderCard(height: 96, borderRadius: 0),
                Padding(
                  padding: const EdgeInsets.only(top: 24, left: 20, right: 24),
                  child: Row(
                    children: [
                      CustomiconContainer(
                        width: 50,
                        height: 50,
                        borderRadius: 100,
                        icon: IconButton(
                          onPressed: () => NavigationService().pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      CustomiconContainer(
                        width: 50,
                        height: 50,
                        borderRadius: 100,
                        icon: Text(
                          widget.title.isNotEmpty
                              ? widget.title[0].toUpperCase()
                              : 'A',
                          style: primaryTextStyle(
                            color: Colors.white,
                            size: 20,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: primaryTextStyle(
                            color: Colors.white,
                            size: 18,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                      CustomiconContainer(
                        width: 48,
                        height: 48,
                        borderRadius: 100,
                        icon: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            IconConstants.optionicon,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Expanded(
              child: StreamBuilder(
                stream: chat.streamMessages(widget.conversationId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData) {
                    return const Center(child: Text("No data"));
                  }

                  final snap =
                      snapshot.data as QuerySnapshot<Map<String, dynamic>>;
                  final docs = snap.docs;

                  if (docs.isEmpty) {
                    return const Center(child: Text("No messages yet"));
                  }

                  return ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                    itemCount: docs.length,
                    itemBuilder: (_, i) {
                      final data = docs[i].data();
                      final senderId = (data['senderId'] ?? '').toString();
                      final text = (data['text'] ?? '').toString();
                      final ts = data['createdAt'] as Timestamp?;
                      final time = _formatTime(ts);

                      final isMe = senderId == chat.myUid;

                      return Align(
                        alignment: isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.72,
                          ),
                          decoration: BoxDecoration(
                            color: isMe ? null : Colors.white,
                            gradient: isMe
                                ? const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFF2F65FF),
                                      Color(0xFF7A2BFF),
                                    ],
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                text,
                                style: primaryTextStyle(
                                  color: isMe
                                      ? Colors.white
                                      : ColorConstant.black,
                                  size: 14,
                                  weight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                time,
                                style: primaryTextStyle(
                                  color: isMe
                                      ? Colors.white.withOpacity(0.85)
                                      : ColorConstant.grey,
                                  size: 11,
                                  weight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 46,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F0F0),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          controller: _controller,
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) async {
                            final t = _controller.text;
                            _controller.clear();
                            await chat.send(widget.conversationId, t);
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type a message...',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () async {
                        final t = _controller.text;
                        _controller.clear();
                        await chat.send(widget.conversationId, t);
                      },
                      child: GradientContainer(
                        width: 48,
                        height: 48,
                        borderRadius: 14,

                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            IconConstants.sendicon,
                            height: 0,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
