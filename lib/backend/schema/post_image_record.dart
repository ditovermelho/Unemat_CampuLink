import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostImageRecord extends FirestoreRecord {
  PostImageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_ref" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _postRef = snapshotData['post_ref'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post_image');

  static Stream<PostImageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostImageRecord.fromSnapshot(s));

  static Future<PostImageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostImageRecord.fromSnapshot(s));

  static PostImageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostImageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostImageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostImageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostImageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostImageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostImageRecordData({
  DocumentReference? postRef,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_ref': postRef,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostImageRecordDocumentEquality implements Equality<PostImageRecord> {
  const PostImageRecordDocumentEquality();

  @override
  bool equals(PostImageRecord? e1, PostImageRecord? e2) {
    return e1?.postRef == e2?.postRef && e1?.image == e2?.image;
  }

  @override
  int hash(PostImageRecord? e) =>
      const ListEquality().hash([e?.postRef, e?.image]);

  @override
  bool isValidKey(Object? o) => o is PostImageRecord;
}
