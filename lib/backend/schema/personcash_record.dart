import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'personcash_record.g.dart';

abstract class PersoncashRecord
    implements Built<PersoncashRecord, PersoncashRecordBuilder> {
  static Serializer<PersoncashRecord> get serializer =>
      _$personcashRecordSerializer;

  String? get name;

  double? get amount;

  String? get status;

  double? get tax;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'vendor_name')
  String? get vendorName;

  DocumentReference? get proref;

  double? get goodnum;

  String? get review;

  DocumentReference? get procashref;

  String? get proname;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PersoncashRecordBuilder builder) => builder
    ..name = ''
    ..amount = 0.0
    ..status = ''
    ..tax = 0.0
    ..vendorName = ''
    ..goodnum = 0.0
    ..review = ''
    ..proname = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('personcash')
          : FirebaseFirestore.instance.collectionGroup('personcash');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('personcash').doc();

  static Stream<PersoncashRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PersoncashRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PersoncashRecord._();
  factory PersoncashRecord([void Function(PersoncashRecordBuilder) updates]) =
      _$PersoncashRecord;

  static PersoncashRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPersoncashRecordData({
  String? name,
  double? amount,
  String? status,
  double? tax,
  DateTime? createdAt,
  String? vendorName,
  DocumentReference? proref,
  double? goodnum,
  String? review,
  DocumentReference? procashref,
  String? proname,
}) {
  final firestoreData = serializers.toFirestore(
    PersoncashRecord.serializer,
    PersoncashRecord(
      (p) => p
        ..name = name
        ..amount = amount
        ..status = status
        ..tax = tax
        ..createdAt = createdAt
        ..vendorName = vendorName
        ..proref = proref
        ..goodnum = goodnum
        ..review = review
        ..procashref = procashref
        ..proname = proname,
    ),
  );

  return firestoreData;
}
