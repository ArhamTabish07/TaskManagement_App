import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/onboarding/provider/user_provider.dart';
import '../domain/chat_repo.dart';

class ChatProvider with ChangeNotifier {
  final ChatRepo chatRepo;
  final UserProvider userProvider;

  ChatProvider({required this.chatRepo, required this.userProvider});

  String get myUid => userProvider.currentUser.uid;
  String get myName => userProvider.currentUser.name;

  Future<void> ensurePublicRoom(String conversationId, String title) {
    return chatRepo.ensurePublicConversation(
      conversationId: conversationId,
      title: title,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamMessages(
    String conversationId,
  ) {
    return chatRepo.streamMessages(conversationId);
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamConversation(
    String conversationId,
  ) {
    return chatRepo.streamConversation(conversationId);
  }

  Future<void> send(String conversationId, String text) async {
    final uid = myUid;
    final name = myName;
    final t = text.trim();

    if (uid.isEmpty) throw Exception("User not logged in");
    if (t.isEmpty) return;

    await chatRepo.sendText(
      conversationId: conversationId,
      senderId: uid,
      senderName: name.trim().isEmpty ? "Unknown" : name.trim(),
      text: t,
    );
  }
}
