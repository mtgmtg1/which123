import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'after_say1_record.g.dart';

abstract class AfterSay1Record
    implements Built<AfterSay1Record, AfterSay1RecordBuilder> {
  static Serializer<AfterSay1Record> get serializer =>
      _$afterSay1RecordSerializer;

  String? get title;

  String? get afterText;

  DateTime? get afterSayTime;

  String? get nickname;

  DocumentReference? get personref;

  DocumentReference? get proref;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(AfterSay1RecordBuilder builder) => builder
    ..title = ''
    ..afterText = ''
    ..nickname = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('afterSay1')
          : FirebaseFirestore.instance.collectionGroup('afterSay1');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('afterSay1').doc();

  static Stream<AfterSay1Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AfterSay1Record> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AfterSay1Record._();
  factory AfterSay1Record([void Function(AfterSay1RecordBuilder) updates]) =
      _$AfterSay1Record;

  static AfterSay1Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAfterSay1RecordData({
  String? title,
  String? afterText,
  DateTime? afterSayTime,
  String? nickname,
  DocumentReference? personref,
  DocumentReference? proref,
}) {
  final firestoreData = serializers.toFirestore(
    AfterSay1Record.serializer,
    AfterSay1Record(
      (a) => a
        ..title = title
        ..afterText = afterText
        ..afterSayTime = afterSayTime
        ..nickname = nickname
        ..personref = personref
        ..proref = proref,
    ),
  );

  return firestoreData;
}
