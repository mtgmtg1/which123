import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'studentcash_record.g.dart';

abstract class StudentcashRecord
    implements Built<StudentcashRecord, StudentcashRecordBuilder> {
  static Serializer<StudentcashRecord> get serializer =>
      _$studentcashRecordSerializer;

  String? get name;

  double? get amount;

  String? get status;

  double? get tax;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'vendor_name')
  String? get vendorName;

  DocumentReference? get personref;

  DocumentReference? get proref;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(StudentcashRecordBuilder builder) => builder
    ..name = ''
    ..amount = 0.0
    ..status = ''
    ..tax = 0.0
    ..vendorName = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('studentcash')
          : FirebaseFirestore.instance.collectionGroup('studentcash');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('studentcash').doc();

  static Stream<StudentcashRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StudentcashRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StudentcashRecord._();
  factory StudentcashRecord([void Function(StudentcashRecordBuilder) updates]) =
      _$StudentcashRecord;

  static StudentcashRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStudentcashRecordData({
  String? name,
  double? amount,
  String? status,
  double? tax,
  DateTime? createdAt,
  String? vendorName,
  DocumentReference? personref,
  DocumentReference? proref,
}) {
  final firestoreData = serializers.toFirestore(
    StudentcashRecord.serializer,
    StudentcashRecord(
      (s) => s
        ..name = name
        ..amount = amount
        ..status = status
        ..tax = tax
        ..createdAt = createdAt
        ..vendorName = vendorName
        ..personref = personref
        ..proref = proref,
    ),
  );

  return firestoreData;
}
