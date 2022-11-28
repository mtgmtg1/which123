import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reservation_record.g.dart';

abstract class ReservationRecord
    implements Built<ReservationRecord, ReservationRecordBuilder> {
  static Serializer<ReservationRecord> get serializer =>
      _$reservationRecordSerializer;

  DocumentReference? get personref;

  DocumentReference? get proref;

  DocumentReference? get priceref;

  DateTime? get createtime;

  int? get duration;

  String? get reviewfromperson;

  String? get reviewfrompro;

  double? get goodnumfromperson;

  double? get goodnumfrompro;

  DateTime? get reservationtime;

  String? get reservemonthday;

  String? get reservehour;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReservationRecordBuilder builder) => builder
    ..duration = 0
    ..reviewfromperson = ''
    ..reviewfrompro = ''
    ..goodnumfromperson = 0.0
    ..goodnumfrompro = 0.0
    ..reservemonthday = ''
    ..reservehour = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservation');

  static Stream<ReservationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReservationRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReservationRecord._();
  factory ReservationRecord([void Function(ReservationRecordBuilder) updates]) =
      _$ReservationRecord;

  static ReservationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReservationRecordData({
  DocumentReference? personref,
  DocumentReference? proref,
  DocumentReference? priceref,
  DateTime? createtime,
  int? duration,
  String? reviewfromperson,
  String? reviewfrompro,
  double? goodnumfromperson,
  double? goodnumfrompro,
  DateTime? reservationtime,
  String? reservemonthday,
  String? reservehour,
}) {
  final firestoreData = serializers.toFirestore(
    ReservationRecord.serializer,
    ReservationRecord(
      (r) => r
        ..personref = personref
        ..proref = proref
        ..priceref = priceref
        ..createtime = createtime
        ..duration = duration
        ..reviewfromperson = reviewfromperson
        ..reviewfrompro = reviewfrompro
        ..goodnumfromperson = goodnumfromperson
        ..goodnumfrompro = goodnumfrompro
        ..reservationtime = reservationtime
        ..reservemonthday = reservemonthday
        ..reservehour = reservehour,
    ),
  );

  return firestoreData;
}
