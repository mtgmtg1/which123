import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pro_record.g.dart';

abstract class ProRecord implements Built<ProRecord, ProRecordBuilder> {
  static Serializer<ProRecord> get serializer => _$proRecordSerializer;

  @BuiltValueField(wireName: 'pro_name')
  String? get proName;

  @BuiltValueField(wireName: 'Pro_info')
  String? get proInfo;

  @BuiltValueField(wireName: 'Date')
  String? get date;

  @BuiltValueField(wireName: 'Intro')
  String? get intro;

  @BuiltValueField(wireName: 'Star')
  String? get star;

  @BuiltValueField(wireName: 'IMG')
  String? get img;

  DocumentReference? get priceref;

  DocumentReference? get userref;

  BuiltList<double>? get goodnum;

  BuiltList<String>? get review;

  int? get price;

  DateTime? get createat;

  String? get catergory;

  double? get totalearn;

  double? get totalspend;

  DocumentReference? get personref;

  BuiltList<DocumentReference>? get personlistref;

  bool? get stop;

  double? get workhistory;

  BuiltList<String>? get workhistorystring;

  String? get phone;

  String? get email;

  BuiltList<String>? get company;

  String? get nowcompany;

  String? get primarycertification;

  String? get secondcertification;

  String? get thirdcertification;

  BuiltList<String>? get morecertification;

  bool? get enrollwaiting;

  bool? get nowactive;

  String? get gender;

  LatLng? get place;

  BuiltList<String>? get mainwork;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProRecordBuilder builder) => builder
    ..proName = ''
    ..proInfo = ''
    ..date = ''
    ..intro = ''
    ..star = ''
    ..img = ''
    ..goodnum = ListBuilder()
    ..review = ListBuilder()
    ..price = 0
    ..catergory = ''
    ..totalearn = 0.0
    ..totalspend = 0.0
    ..personlistref = ListBuilder()
    ..stop = false
    ..workhistory = 0.0
    ..workhistorystring = ListBuilder()
    ..phone = ''
    ..email = ''
    ..company = ListBuilder()
    ..nowcompany = ''
    ..primarycertification = ''
    ..secondcertification = ''
    ..thirdcertification = ''
    ..morecertification = ListBuilder()
    ..enrollwaiting = false
    ..nowactive = false
    ..gender = ''
    ..mainwork = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Pro');

  static Stream<ProRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProRecord._();
  factory ProRecord([void Function(ProRecordBuilder) updates]) = _$ProRecord;

  static ProRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProRecordData({
  String? proName,
  String? proInfo,
  String? date,
  String? intro,
  String? star,
  String? img,
  DocumentReference? priceref,
  DocumentReference? userref,
  int? price,
  DateTime? createat,
  String? catergory,
  double? totalearn,
  double? totalspend,
  DocumentReference? personref,
  bool? stop,
  double? workhistory,
  String? phone,
  String? email,
  String? nowcompany,
  String? primarycertification,
  String? secondcertification,
  String? thirdcertification,
  bool? enrollwaiting,
  bool? nowactive,
  String? gender,
  LatLng? place,
}) {
  final firestoreData = serializers.toFirestore(
    ProRecord.serializer,
    ProRecord(
      (p) => p
        ..proName = proName
        ..proInfo = proInfo
        ..date = date
        ..intro = intro
        ..star = star
        ..img = img
        ..priceref = priceref
        ..userref = userref
        ..goodnum = null
        ..review = null
        ..price = price
        ..createat = createat
        ..catergory = catergory
        ..totalearn = totalearn
        ..totalspend = totalspend
        ..personref = personref
        ..personlistref = null
        ..stop = stop
        ..workhistory = workhistory
        ..workhistorystring = null
        ..phone = phone
        ..email = email
        ..company = null
        ..nowcompany = nowcompany
        ..primarycertification = primarycertification
        ..secondcertification = secondcertification
        ..thirdcertification = thirdcertification
        ..morecertification = null
        ..enrollwaiting = enrollwaiting
        ..nowactive = nowactive
        ..gender = gender
        ..place = place
        ..mainwork = null,
    ),
  );

  return firestoreData;
}
