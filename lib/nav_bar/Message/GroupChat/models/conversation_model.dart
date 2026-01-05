import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationModel {
  final String id;
  final String title;
  final List<String> members;
  final String lastMessage;
  final DateTime? lastMessageAt;

  const ConversationModel({
    required this.id,
    required this.title,
    required this.members,
    required this.lastMessage,
    required this.lastMessageAt,
  });

  int get membersCount => members.length;

  factory ConversationModel.fromDoc(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};
    final ts = data['lastMessageAt'];

    return ConversationModel(
      id: doc.id,
      title: (data['title'] ?? '').toString(),
      members: List<String>.from(data['members'] ?? const <String>[]),
      lastMessage: (data['lastMessage'] ?? '').toString(),
      lastMessageAt: ts is Timestamp ? ts.toDate() : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'members': members,
      'lastMessage': lastMessage,
      'lastMessageAt': lastMessageAt,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
