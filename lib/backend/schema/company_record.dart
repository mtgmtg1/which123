import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'company_record.g.dart';

abstract class CompanyRecord
    implements Built<CompanyRecord, CompanyRecordBuilder> {
  static Serializer<CompanyRecord> get serializer => _$companyRecordSerializer;

  String? get introduce;

  String? get homepage;

  String? get logo;

  DocumentReference? get personRef;

  String? get kids;

  String? get kidsdetail;

  String? get place;

  String? get placedetail;

  String? get officecatergory;

  String? get officename;

  String? get size;

  String? get address;

  String? get phone;

  String? get fax;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CompanyRecordBuilder builder) => builder
    ..introduce = ''
    ..homepage = ''
    ..logo = ''
    ..kids = ''
    ..kidsdetail = ''
    ..place = ''
    ..placedetail = ''
    ..officecatergory = ''
    ..officename = ''
    ..size = ''
    ..address = ''
    ..phone = ''
    ..fax = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('company');

  static Stream<CompanyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CompanyRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CompanyRecord._();
  factory CompanyRecord([void Function(CompanyRecordBuilder) updates]) =
      _$CompanyRecord;

  static CompanyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCompanyRecordData({
  String? introduce,
  String? homepage,
  String? logo,
  DocumentReference? personRef,
  String? kids,
  String? kidsdetail,
  String? place,
  String? placedetail,
  String? officecatergory,
  String? officename,
  String? size,
  String? address,
  String? phone,
  String? fax,
}) {
  final firestoreData = serializers.toFirestore(
    CompanyRecord.serializer,
    CompanyRecord(
      (c) => c
        ..introduce = introduce
        ..homepage = homepage
        ..logo = logo
        ..personRef = personRef
        ..kids = kids
        ..kidsdetail = kidsdetail
        ..place = place
        ..placedetail = placedetail
        ..officecatergory = officecatergory
        ..officename = officename
        ..size = size
        ..address = address
        ..phone = phone
        ..fax = fax,
    ),
  );

  return firestoreData;
}
