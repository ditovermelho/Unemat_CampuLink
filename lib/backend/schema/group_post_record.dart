import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupPostRecord extends FirestoreRecord {
  GroupPostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "group_ref" field.
  DocumentReference? _groupRef;
  DocumentReference? get groupRef => _groupRef;
  bool hasGroupRef() => _groupRef != null;

  // "post_ref" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  void _initializeFields() {
    _groupRef = snapshotData['group_ref'] as DocumentReference?;
    _postRef = snapshotData['post_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('group_post');

  static Stream<GroupPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupPostRecord.fromSnapshot(s));

  static Future<GroupPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupPostRecord.fromSnapshot(s));

  static GroupPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupPostRecordData({
  DocumentReference? groupRef,
  DocumentReference? postRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'group_ref': groupRef,
      'post_ref': postRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupPostRecordDocumentEquality implements Equality<GroupPostRecord> {
  const GroupPostRecordDocumentEquality();

  @override
  bool equals(GroupPostRecord? e1, GroupPostRecord? e2) {
    return e1?.groupRef == e2?.groupRef && e1?.postRef == e2?.postRef;
  }

  @override
  int hash(GroupPostRecord? e) =>
      const ListEquality().hash([e?.groupRef, e?.postRef]);

  @override
  bool isValidKey(Object? o) => o is GroupPostRecord;
}
