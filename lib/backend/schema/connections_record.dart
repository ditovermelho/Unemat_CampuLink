import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConnectionsRecord extends FirestoreRecord {
  ConnectionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "other_user" field.
  DocumentReference? _otherUser;
  DocumentReference? get otherUser => _otherUser;
  bool hasOtherUser() => _otherUser != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _otherUser = snapshotData['other_user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('connections');

  static Stream<ConnectionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConnectionsRecord.fromSnapshot(s));

  static Future<ConnectionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConnectionsRecord.fromSnapshot(s));

  static ConnectionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConnectionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConnectionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConnectionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConnectionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConnectionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConnectionsRecordData({
  DocumentReference? userRef,
  DocumentReference? otherUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'other_user': otherUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConnectionsRecordDocumentEquality implements Equality<ConnectionsRecord> {
  const ConnectionsRecordDocumentEquality();

  @override
  bool equals(ConnectionsRecord? e1, ConnectionsRecord? e2) {
    return e1?.userRef == e2?.userRef && e1?.otherUser == e2?.otherUser;
  }

  @override
  int hash(ConnectionsRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.otherUser]);

  @override
  bool isValidKey(Object? o) => o is ConnectionsRecord;
}
