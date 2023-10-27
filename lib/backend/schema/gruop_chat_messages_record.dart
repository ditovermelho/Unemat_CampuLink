import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GruopChatMessagesRecord extends FirestoreRecord {
  GruopChatMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "group_ref" field.
  DocumentReference? _groupRef;
  DocumentReference? get groupRef => _groupRef;
  bool hasGroupRef() => _groupRef != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _image = snapshotData['image'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _groupRef = snapshotData['group_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gruop_chat_messages');

  static Stream<GruopChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GruopChatMessagesRecord.fromSnapshot(s));

  static Future<GruopChatMessagesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GruopChatMessagesRecord.fromSnapshot(s));

  static GruopChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GruopChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GruopChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GruopChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GruopChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GruopChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGruopChatMessagesRecordData({
  DocumentReference? user,
  String? text,
  String? image,
  DateTime? timestamp,
  DocumentReference? groupRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'text': text,
      'image': image,
      'timestamp': timestamp,
      'group_ref': groupRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class GruopChatMessagesRecordDocumentEquality
    implements Equality<GruopChatMessagesRecord> {
  const GruopChatMessagesRecordDocumentEquality();

  @override
  bool equals(GruopChatMessagesRecord? e1, GruopChatMessagesRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.text == e2?.text &&
        e1?.image == e2?.image &&
        e1?.timestamp == e2?.timestamp &&
        e1?.groupRef == e2?.groupRef;
  }

  @override
  int hash(GruopChatMessagesRecord? e) => const ListEquality()
      .hash([e?.user, e?.text, e?.image, e?.timestamp, e?.groupRef]);

  @override
  bool isValidKey(Object? o) => o is GruopChatMessagesRecord;
}
