import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'admincash_record.g.dart';

abstract class AdmincashRecord
    implements Built<AdmincashRecord, AdmincashRecordBuilder> {
  static Serializer<AdmincashRecord> get serializer =>
      _$admincashRecordSerializer;

  String? get name;

  double? get amount;

  String? get status;

  double? get tax;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'vendor_name')
  String? get vendorName;

  double? get totalearn;

  double? get totalspend;

  int? get totalpersonnum;

  int? get monthpersonnum;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AdmincashRecordBuilder builder) => builder
    ..name = ''
    ..amount = 0.0
    ..status = ''
    ..tax = 0.0
    ..vendorName = ''
    ..totalearn = 0.0
    ..totalspend = 0.0
    ..totalpersonnum = 0
    ..monthpersonnum = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admincash');

  static Stream<AdmincashRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AdmincashRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AdmincashRecord._();
  factory AdmincashRecord([void Function(AdmincashRecordBuilder) updates]) =
      _$AdmincashRecord;

  static AdmincashRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAdmincashRecordData({
  String? name,
  double? amount,
  String? status,
  double? tax,
  DateTime? createdAt,
  String? vendorName,
  double? totalearn,
  double? totalspend,
  int? totalpersonnum,
  int? monthpersonnum,
}) {
  final firestoreData = serializers.toFirestore(
    AdmincashRecord.serializer,
    AdmincashRecord(
      (a) => a
        ..name = name
        ..amount = amount
        ..status = status
        ..tax = tax
        ..createdAt = createdAt
        ..vendorName = vendorName
        ..totalearn = totalearn
        ..totalspend = totalspend
        ..totalpersonnum = totalpersonnum
        ..monthpersonnum = monthpersonnum,
    ),
  );

  return firestoreData;
}
