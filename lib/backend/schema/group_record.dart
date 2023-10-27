import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupRecord extends FirestoreRecord {
  GroupRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "group_photo" field.
  String? _groupPhoto;
  String get groupPhoto => _groupPhoto ?? '';
  bool hasGroupPhoto() => _groupPhoto != null;

  // "group_name" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  // "group_creator" field.
  DocumentReference? _groupCreator;
  DocumentReference? get groupCreator => _groupCreator;
  bool hasGroupCreator() => _groupCreator != null;

  // "group_created_time" field.
  DateTime? _groupCreatedTime;
  DateTime? get groupCreatedTime => _groupCreatedTime;
  bool hasGroupCreatedTime() => _groupCreatedTime != null;

  // "group_descrision" field.
  String? _groupDescrision;
  String get groupDescrision => _groupDescrision ?? '';
  bool hasGroupDescrision() => _groupDescrision != null;

  void _initializeFields() {
    _groupPhoto = snapshotData['group_photo'] as String?;
    _groupName = snapshotData['group_name'] as String?;
    _groupCreator = snapshotData['group_creator'] as DocumentReference?;
    _groupCreatedTime = snapshotData['group_created_time'] as DateTime?;
    _groupDescrision = snapshotData['group_descrision'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('group');

  static Stream<GroupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupRecord.fromSnapshot(s));

  static Future<GroupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupRecord.fromSnapshot(s));

  static GroupRecord fromSnapshot(DocumentSnapshot snapshot) => GroupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupRecordData({
  String? groupPhoto,
  String? groupName,
  DocumentReference? groupCreator,
  DateTime? groupCreatedTime,
  String? groupDescrision,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'group_photo': groupPhoto,
      'group_name': groupName,
      'group_creator': groupCreator,
      'group_created_time': groupCreatedTime,
      'group_descrision': groupDescrision,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupRecordDocumentEquality implements Equality<GroupRecord> {
  const GroupRecordDocumentEquality();

  @override
  bool equals(GroupRecord? e1, GroupRecord? e2) {
    return e1?.groupPhoto == e2?.groupPhoto &&
        e1?.groupName == e2?.groupName &&
        e1?.groupCreator == e2?.groupCreator &&
        e1?.groupCreatedTime == e2?.groupCreatedTime &&
        e1?.groupDescrision == e2?.groupDescrision;
  }

  @override
  int hash(GroupRecord? e) => const ListEquality().hash([
        e?.groupPhoto,
        e?.groupName,
        e?.groupCreator,
        e?.groupCreatedTime,
        e?.groupDescrision
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupRecord;
}
