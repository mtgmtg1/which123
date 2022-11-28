import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'after_say_record.g.dart';

abstract class AfterSayRecord
    implements Built<AfterSayRecord, AfterSayRecordBuilder> {
  static Serializer<AfterSayRecord> get serializer =>
      _$afterSayRecordSerializer;

  String? get title;

  String? get text;

  DateTime? get time;

  int? get goodNum;

  DocumentReference? get personRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AfterSayRecordBuilder builder) => builder
    ..title = ''
    ..text = ''
    ..goodNum = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('afterSay');

  static Stream<AfterSayRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AfterSayRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AfterSayRecord._();
  factory AfterSayRecord([void Function(AfterSayRecordBuilder) updates]) =
      _$AfterSayRecord;

  static AfterSayRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAfterSayRecordData({
  String? title,
  String? text,
  DateTime? time,
  int? goodNum,
  DocumentReference? personRef,
}) {
  final firestoreData = serializers.toFirestore(
    AfterSayRecord.serializer,
    AfterSayRecord(
      (a) => a
        ..title = title
        ..text = text
        ..time = time
        ..goodNum = goodNum
        ..personRef = personRef,
    ),
  );

  return firestoreData;
}
