import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GruopMebresRecord extends FirestoreRecord {
  GruopMebresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "group_ref" field.
  DocumentReference? _groupRef;
  DocumentReference? get groupRef => _groupRef;
  bool hasGroupRef() => _groupRef != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _groupRef = snapshotData['group_ref'] as DocumentReference?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gruop_mebres');

  static Stream<GruopMebresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GruopMebresRecord.fromSnapshot(s));

  static Future<GruopMebresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GruopMebresRecord.fromSnapshot(s));

  static GruopMebresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GruopMebresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GruopMebresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GruopMebresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GruopMebresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GruopMebresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGruopMebresRecordData({
  DocumentReference? groupRef,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'group_ref': groupRef,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class GruopMebresRecordDocumentEquality implements Equality<GruopMebresRecord> {
  const GruopMebresRecordDocumentEquality();

  @override
  bool equals(GruopMebresRecord? e1, GruopMebresRecord? e2) {
    return e1?.groupRef == e2?.groupRef && e1?.userRef == e2?.userRef;
  }

  @override
  int hash(GruopMebresRecord? e) =>
      const ListEquality().hash([e?.groupRef, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is GruopMebresRecord;
}
