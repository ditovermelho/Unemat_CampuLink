import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupChatRecord extends FirestoreRecord {
  GroupChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "grup_ref" field.
  DocumentReference? _grupRef;
  DocumentReference? get grupRef => _grupRef;
  bool hasGrupRef() => _grupRef != null;

  // "mensege_ref" field.
  DocumentReference? _mensegeRef;
  DocumentReference? get mensegeRef => _mensegeRef;
  bool hasMensegeRef() => _mensegeRef != null;

  void _initializeFields() {
    _grupRef = snapshotData['grup_ref'] as DocumentReference?;
    _mensegeRef = snapshotData['mensege_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('group_chat');

  static Stream<GroupChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupChatRecord.fromSnapshot(s));

  static Future<GroupChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupChatRecord.fromSnapshot(s));

  static GroupChatRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupChatRecordData({
  DocumentReference? grupRef,
  DocumentReference? mensegeRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'grup_ref': grupRef,
      'mensege_ref': mensegeRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupChatRecordDocumentEquality implements Equality<GroupChatRecord> {
  const GroupChatRecordDocumentEquality();

  @override
  bool equals(GroupChatRecord? e1, GroupChatRecord? e2) {
    return e1?.grupRef == e2?.grupRef && e1?.mensegeRef == e2?.mensegeRef;
  }

  @override
  int hash(GroupChatRecord? e) =>
      const ListEquality().hash([e?.grupRef, e?.mensegeRef]);

  @override
  bool isValidKey(Object? o) => o is GroupChatRecord;
}
