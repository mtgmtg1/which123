import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'earn_record.g.dart';

abstract class EarnRecord implements Built<EarnRecord, EarnRecordBuilder> {
  static Serializer<EarnRecord> get serializer => _$earnRecordSerializer;

  String? get name;

  double? get amount;

  String? get status;

  double? get tax;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'vendor_name')
  String? get vendorName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(EarnRecordBuilder builder) => builder
    ..name = ''
    ..amount = 0.0
    ..status = ''
    ..tax = 0.0
    ..vendorName = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('earn')
          : FirebaseFirestore.instance.collectionGroup('earn');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('earn').doc();

  static Stream<EarnRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EarnRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  EarnRecord._();
  factory EarnRecord([void Function(EarnRecordBuilder) updates]) = _$EarnRecord;

  static EarnRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEarnRecordData({
  String? name,
  double? amount,
  String? status,
  double? tax,
  DateTime? createdAt,
  String? vendorName,
}) {
  final firestoreData = serializers.toFirestore(
    EarnRecord.serializer,
    EarnRecord(
      (e) => e
        ..name = name
        ..amount = amount
        ..status = status
        ..tax = tax
        ..createdAt = createdAt
        ..vendorName = vendorName,
    ),
  );

  return firestoreData;
}
