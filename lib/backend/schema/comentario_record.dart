import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComentarioRecord extends FirestoreRecord {
  ComentarioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mensagem" field.
  String? _mensagem;
  String get mensagem => _mensagem ?? '';
  bool hasMensagem() => _mensagem != null;

  // "id_post" field.
  DocumentReference? _idPost;
  DocumentReference? get idPost => _idPost;
  bool hasIdPost() => _idPost != null;

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _mensagem = snapshotData['mensagem'] as String?;
    _idPost = snapshotData['id_post'] as DocumentReference?;
    _idUser = snapshotData['id_user'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comentario');

  static Stream<ComentarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComentarioRecord.fromSnapshot(s));

  static Future<ComentarioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComentarioRecord.fromSnapshot(s));

  static ComentarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComentarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComentarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComentarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComentarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComentarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComentarioRecordData({
  String? mensagem,
  DocumentReference? idPost,
  DocumentReference? idUser,
  DateTime? createdTime,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mensagem': mensagem,
      'id_post': idPost,
      'id_user': idUser,
      'created_time': createdTime,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComentarioRecordDocumentEquality implements Equality<ComentarioRecord> {
  const ComentarioRecordDocumentEquality();

  @override
  bool equals(ComentarioRecord? e1, ComentarioRecord? e2) {
    return e1?.mensagem == e2?.mensagem &&
        e1?.idPost == e2?.idPost &&
        e1?.idUser == e2?.idUser &&
        e1?.createdTime == e2?.createdTime &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ComentarioRecord? e) => const ListEquality()
      .hash([e?.mensagem, e?.idPost, e?.idUser, e?.createdTime, e?.image]);

  @override
  bool isValidKey(Object? o) => o is ComentarioRecord;
}
