import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'proaftersay_record.g.dart';

abstract class ProaftersayRecord
    implements Built<ProaftersayRecord, ProaftersayRecordBuilder> {
  static Serializer<ProaftersayRecord> get serializer =>
      _$proaftersayRecordSerializer;

  @BuiltValueField(wireName: 'post_photo')
  String? get postPhoto;

  @BuiltValueField(wireName: 'post_title')
  String? get postTitle;

  @BuiltValueField(wireName: 'post_description')
  String? get postDescription;

  @BuiltValueField(wireName: 'post_user')
  DocumentReference? get postUser;

  @BuiltValueField(wireName: 'time_posted')
  DateTime? get timePosted;

  @BuiltValueField(wireName: 'num_comments')
  int? get numComments;

  @BuiltValueField(wireName: 'num_votes')
  int? get numVotes;

  double? get goodnum;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ProaftersayRecordBuilder builder) => builder
    ..postPhoto = ''
    ..postTitle = ''
    ..postDescription = ''
    ..numComments = 0
    ..numVotes = 0
    ..goodnum = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('proaftersay')
          : FirebaseFirestore.instance.collectionGroup('proaftersay');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('proaftersay').doc();

  static Stream<ProaftersayRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProaftersayRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProaftersayRecord._();
  factory ProaftersayRecord([void Function(ProaftersayRecordBuilder) updates]) =
      _$ProaftersayRecord;

  static ProaftersayRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProaftersayRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  int? numVotes,
  double? goodnum,
}) {
  final firestoreData = serializers.toFirestore(
    ProaftersayRecord.serializer,
    ProaftersayRecord(
      (p) => p
        ..postPhoto = postPhoto
        ..postTitle = postTitle
        ..postDescription = postDescription
        ..postUser = postUser
        ..timePosted = timePosted
        ..numComments = numComments
        ..numVotes = numVotes
        ..goodnum = goodnum,
    ),
  );

  return firestoreData;
}
