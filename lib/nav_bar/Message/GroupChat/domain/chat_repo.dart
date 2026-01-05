import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatRepo {
  Future<void> ensurePublicConversation({
    required String conversationId,
    required String title,
  });

  Stream<QuerySnapshot<Map<String, dynamic>>> streamMessages(
    String conversationId,
  );

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamConversation(
    String conversationId,
  );

  Future<void> sendText({
    required String conversationId,
    required String senderId,
    required String senderName,
    required String text,
  });
}
