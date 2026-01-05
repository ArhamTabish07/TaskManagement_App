import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/chat_repo.dart';
import 'chat_datasource.dart';

class ChatRepoImpl implements ChatRepo {
  final ChatDatasource datasource;

  ChatRepoImpl({required this.datasource});

  @override
  Future<void> ensurePublicConversation({
    required String conversationId,
    required String title,
  }) {
    return datasource.ensurePublicConversation(
      conversationId: conversationId,
      title: title,
    );
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> streamMessages(
    String conversationId,
  ) {
    return datasource.streamMessages(conversationId);
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamConversation(
    String conversationId,
  ) {
    return datasource.streamConversation(conversationId);
  }

  @override
  Future<void> sendText({
    required String conversationId,
    required String senderId,
    required String senderName,
    required String text,
  }) {
    return datasource.sendText(
      conversationId: conversationId,
      senderId: senderId,
      senderName: senderName,
      text: text,
    );
  }
}
