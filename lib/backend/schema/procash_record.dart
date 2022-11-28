import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'procash_record.g.dart';

abstract class ProcashRecord
    implements Built<ProcashRecord, ProcashRecordBuilder> {
  static Serializer<ProcashRecord> get serializer => _$procashRecordSerializer;

  String? get name;

  double? get amount;

  String? get status;

  double? get tax;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'vendor_name')
  String? get vendorName;

  DocumentReference? get personref;

  String? get review;

  double? get goodnum;

  DocumentReference? get personcashref;

  String? get personname;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ProcashRecordBuilder builder) => builder
    ..name = ''
    ..amount = 0.0
    ..status = ''
    ..tax = 0.0
    ..vendorName = ''
    ..review = ''
    ..goodnum = 0.0
    ..personname = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('procash')
          : FirebaseFirestore.instance.collectionGroup('procash');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('procash').doc();

  static Stream<ProcashRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProcashRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProcashRecord._();
  factory ProcashRecord([void Function(ProcashRecordBuilder) updates]) =
      _$ProcashRecord;

  static ProcashRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProcashRecordData({
  String? name,
  double? amount,
  String? status,
  double? tax,
  DateTime? createdAt,
  String? vendorName,
  DocumentReference? personref,
  String? review,
  double? goodnum,
  DocumentReference? personcashref,
  String? personname,
}) {
  final firestoreData = serializers.toFirestore(
    ProcashRecord.serializer,
    ProcashRecord(
      (p) => p
        ..name = name
        ..amount = amount
        ..status = status
        ..tax = tax
        ..createdAt = createdAt
        ..vendorName = vendorName
        ..personref = personref
        ..review = review
        ..goodnum = goodnum
        ..personcashref = personcashref
        ..personname = personname,
    ),
  );

  return firestoreData;
}
