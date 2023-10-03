import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MensegeRecord extends FirestoreRecord {
  MensegeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "mensege" field.
  String? _mensege;
  String get mensege => _mensege ?? '';
  bool hasMensege() => _mensege != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _mensege = snapshotData['mensege'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mensege');

  static Stream<MensegeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MensegeRecord.fromSnapshot(s));

  static Future<MensegeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MensegeRecord.fromSnapshot(s));

  static MensegeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MensegeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MensegeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MensegeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MensegeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MensegeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMensegeRecordData({
  DocumentReference? userRef,
  String? mensege,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'mensege': mensege,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class MensegeRecordDocumentEquality implements Equality<MensegeRecord> {
  const MensegeRecordDocumentEquality();

  @override
  bool equals(MensegeRecord? e1, MensegeRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.mensege == e2?.mensege &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(MensegeRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.mensege, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is MensegeRecord;
}
