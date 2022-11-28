import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'price_record.g.dart';

abstract class PriceRecord implements Built<PriceRecord, PriceRecordBuilder> {
  static Serializer<PriceRecord> get serializer => _$priceRecordSerializer;

  String? get name;

  double? get amount;

  String? get status;

  double? get tax;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'vendor_name')
  String? get vendorName;

  DocumentReference? get proref;

  DocumentReference? get personref;

  int? get price;

  DocumentReference? get studentref;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PriceRecordBuilder builder) => builder
    ..name = ''
    ..amount = 0.0
    ..status = ''
    ..tax = 0.0
    ..vendorName = ''
    ..price = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('price');

  static Stream<PriceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PriceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PriceRecord._();
  factory PriceRecord([void Function(PriceRecordBuilder) updates]) =
      _$PriceRecord;

  static PriceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPriceRecordData({
  String? name,
  double? amount,
  String? status,
  double? tax,
  DateTime? createdAt,
  String? vendorName,
  DocumentReference? proref,
  DocumentReference? personref,
  int? price,
  DocumentReference? studentref,
}) {
  final firestoreData = serializers.toFirestore(
    PriceRecord.serializer,
    PriceRecord(
      (p) => p
        ..name = name
        ..amount = amount
        ..status = status
        ..tax = tax
        ..createdAt = createdAt
        ..vendorName = vendorName
        ..proref = proref
        ..personref = personref
        ..price = price
        ..studentref = studentref,
    ),
  );

  return firestoreData;
}
