import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'contents_record.g.dart';

abstract class ContentsRecord
    implements Built<ContentsRecord, ContentsRecordBuilder> {
  static Serializer<ContentsRecord> get serializer =>
      _$contentsRecordSerializer;

  String? get title;

  String? get text;

  String? get image;

  DateTime? get postTime;

  String? get newUrl;

  String? get catergory;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ContentsRecordBuilder builder) => builder
    ..title = ''
    ..text = ''
    ..image = ''
    ..newUrl = ''
    ..catergory = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contents');

  static Stream<ContentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ContentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ContentsRecord._();
  factory ContentsRecord([void Function(ContentsRecordBuilder) updates]) =
      _$ContentsRecord;

  static ContentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createContentsRecordData({
  String? title,
  String? text,
  String? image,
  DateTime? postTime,
  String? newUrl,
  String? catergory,
}) {
  final firestoreData = serializers.toFirestore(
    ContentsRecord.serializer,
    ContentsRecord(
      (c) => c
        ..title = title
        ..text = text
        ..image = image
        ..postTime = postTime
        ..newUrl = newUrl
        ..catergory = catergory,
    ),
  );

  return firestoreData;
}
