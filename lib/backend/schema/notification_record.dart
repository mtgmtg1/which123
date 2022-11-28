import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notification_record.g.dart';

abstract class NotificationRecord
    implements Built<NotificationRecord, NotificationRecordBuilder> {
  static Serializer<NotificationRecord> get serializer =>
      _$notificationRecordSerializer;

  @BuiltValueField(wireName: 'post_photo')
  String? get postPhoto;

  @BuiltValueField(wireName: 'post_title')
  String? get postTitle;

  @BuiltValueField(wireName: 'post_description')
  String? get postDescription;

  @BuiltValueField(wireName: 'time_posted')
  DateTime? get timePosted;

  @BuiltValueField(wireName: 'num_comments')
  int? get numComments;

  @BuiltValueField(wireName: 'num_votes')
  int? get numVotes;

  DocumentReference? get frompersonref;

  DocumentReference? get frompostref;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(NotificationRecordBuilder builder) => builder
    ..postPhoto = ''
    ..postTitle = ''
    ..postDescription = ''
    ..numComments = 0
    ..numVotes = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notification')
          : FirebaseFirestore.instance.collectionGroup('notification');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('notification').doc();

  static Stream<NotificationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NotificationRecord._();
  factory NotificationRecord(
          [void Function(NotificationRecordBuilder) updates]) =
      _$NotificationRecord;

  static NotificationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNotificationRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DateTime? timePosted,
  int? numComments,
  int? numVotes,
  DocumentReference? frompersonref,
  DocumentReference? frompostref,
}) {
  final firestoreData = serializers.toFirestore(
    NotificationRecord.serializer,
    NotificationRecord(
      (n) => n
        ..postPhoto = postPhoto
        ..postTitle = postTitle
        ..postDescription = postDescription
        ..timePosted = timePosted
        ..numComments = numComments
        ..numVotes = numVotes
        ..frompersonref = frompersonref
        ..frompostref = frompostref,
    ),
  );

  return firestoreData;
}
