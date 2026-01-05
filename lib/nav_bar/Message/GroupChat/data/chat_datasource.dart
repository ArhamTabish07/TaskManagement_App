import 'package:cloud_firestore/cloud_firestore.dart';

class ChatDatasource {
  final FirebaseFirestore _firestore;

  ChatDatasource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  DocumentReference<Map<String, dynamic>> _convoRef(String conversationId) {
    return _firestore.collection('conversations').doc(conversationId);
  }

  CollectionReference<Map<String, dynamic>> _msgCol(String conversationId) {
    return _convoRef(conversationId).collection('messages');
  }

  Future<void> ensurePublicConversation({
    required String conversationId,
    required String title,
  }) async {
    final ref = _convoRef(conversationId);
    final doc = await ref.get();

    if (doc.exists) return;

    await ref.set({
      'id': conversationId,
      'title': title,
      'isPublic': true,
      'createdAt': FieldValue.serverTimestamp(),
      'lastMessage': '',
      'lastMessageAt': null,
      'lastSenderId': '',
      'lastSenderName': '',
    }, SetOptions(merge: true));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamMessages(
    String conversationId,
  ) {
    return _msgCol(
      conversationId,
    ).orderBy('createdAt', descending: true).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamConversation(
    String conversationId,
  ) {
    return _convoRef(conversationId).snapshots();
  }

  Future<void> sendText({
    required String conversationId,
    required String senderId,
    required String senderName,
    required String text,
  }) async {
    final t = text.trim();
    if (t.isEmpty) return;

    final convoRef = _convoRef(conversationId);
    final msgRef = _msgCol(conversationId).doc();

    final now = FieldValue.serverTimestamp();

    final batch = _firestore.batch();

    // Message
    batch.set(msgRef, {
      'id': msgRef.id,
      'text': t,
      'senderId': senderId,
      'senderName': senderName,
      'createdAt': now,
    });

    // Conversation summary (for card preview)
    batch.set(convoRef, {
      'lastMessage': t,
      'lastMessageAt': now,
      'lastSenderId': senderId,
      'lastSenderName': senderName,
    }, SetOptions(merge: true));

    await batch.commit();
  }
}
