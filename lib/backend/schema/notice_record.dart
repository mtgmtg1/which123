import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notice_record.g.dart';

abstract class NoticeRecord
    implements Built<NoticeRecord, NoticeRecordBuilder> {
  static Serializer<NoticeRecord> get serializer => _$noticeRecordSerializer;

  String? get no;

  @BuiltValueField(wireName: 'Title')
  String? get title;

  @BuiltValueField(wireName: 'Time')
  DateTime? get time;

  String? get txt;

  int? get view;

  DocumentReference? get personref;

  DocumentReference? get companyref;

  DocumentReference? get contentsref;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NoticeRecordBuilder builder) => builder
    ..no = ''
    ..title = ''
    ..txt = ''
    ..view = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notice');

  static Stream<NoticeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NoticeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NoticeRecord._();
  factory NoticeRecord([void Function(NoticeRecordBuilder) updates]) =
      _$NoticeRecord;

  static NoticeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNoticeRecordData({
  String? no,
  String? title,
  DateTime? time,
  String? txt,
  int? view,
  DocumentReference? personref,
  DocumentReference? companyref,
  DocumentReference? contentsref,
}) {
  final firestoreData = serializers.toFirestore(
    NoticeRecord.serializer,
    NoticeRecord(
      (n) => n
        ..no = no
        ..title = title
        ..time = time
        ..txt = txt
        ..view = view
        ..personref = personref
        ..companyref = companyref
        ..contentsref = contentsref,
    ),
  );

  return firestoreData;
}
