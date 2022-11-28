import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'feelset_record.g.dart';

abstract class FeelsetRecord
    implements Built<FeelsetRecord, FeelsetRecordBuilder> {
  static Serializer<FeelsetRecord> get serializer => _$feelsetRecordSerializer;

  int? get feel;

  DateTime? get createat;

  DocumentReference? get userref;

  int? get day;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FeelsetRecordBuilder builder) => builder
    ..feel = 0
    ..day = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feelset');

  static Stream<FeelsetRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FeelsetRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FeelsetRecord._();
  factory FeelsetRecord([void Function(FeelsetRecordBuilder) updates]) =
      _$FeelsetRecord;

  static FeelsetRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFeelsetRecordData({
  int? feel,
  DateTime? createat,
  DocumentReference? userref,
  int? day,
}) {
  final firestoreData = serializers.toFirestore(
    FeelsetRecord.serializer,
    FeelsetRecord(
      (f) => f
        ..feel = feel
        ..createat = createat
        ..userref = userref
        ..day = day,
    ),
  );

  return firestoreData;
}
