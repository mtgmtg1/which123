import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'balance_record.g.dart';

abstract class BalanceRecord
    implements Built<BalanceRecord, BalanceRecordBuilder> {
  static Serializer<BalanceRecord> get serializer => _$balanceRecordSerializer;

  int? get totalearn;

  int? get totalspend;

  int? get balance;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(BalanceRecordBuilder builder) => builder
    ..totalearn = 0
    ..totalspend = 0
    ..balance = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('balance')
          : FirebaseFirestore.instance.collectionGroup('balance');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('balance').doc();

  static Stream<BalanceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BalanceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BalanceRecord._();
  factory BalanceRecord([void Function(BalanceRecordBuilder) updates]) =
      _$BalanceRecord;

  static BalanceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBalanceRecordData({
  int? totalearn,
  int? totalspend,
  int? balance,
}) {
  final firestoreData = serializers.toFirestore(
    BalanceRecord.serializer,
    BalanceRecord(
      (b) => b
        ..totalearn = totalearn
        ..totalspend = totalspend
        ..balance = balance,
    ),
  );

  return firestoreData;
}
