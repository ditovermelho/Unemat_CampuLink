import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostUsersListLikeRecord extends FirestoreRecord {
  PostUsersListLikeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_ref" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _postRef = snapshotData['post_ref'] as DocumentReference?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post_users_list_like');

  static Stream<PostUsersListLikeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostUsersListLikeRecord.fromSnapshot(s));

  static Future<PostUsersListLikeRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PostUsersListLikeRecord.fromSnapshot(s));

  static PostUsersListLikeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostUsersListLikeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostUsersListLikeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostUsersListLikeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostUsersListLikeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostUsersListLikeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostUsersListLikeRecordData({
  DocumentReference? postRef,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_ref': postRef,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostUsersListLikeRecordDocumentEquality
    implements Equality<PostUsersListLikeRecord> {
  const PostUsersListLikeRecordDocumentEquality();

  @override
  bool equals(PostUsersListLikeRecord? e1, PostUsersListLikeRecord? e2) {
    return e1?.postRef == e2?.postRef && e1?.userRef == e2?.userRef;
  }

  @override
  int hash(PostUsersListLikeRecord? e) =>
      const ListEquality().hash([e?.postRef, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is PostUsersListLikeRecord;
}
