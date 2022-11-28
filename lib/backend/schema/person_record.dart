import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'person_record.g.dart';

abstract class PersonRecord
    implements Built<PersonRecord, PersonRecordBuilder> {
  static Serializer<PersonRecord> get serializer => _$personRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  BuiltList<String>? get certificate;

  String? get introduce;

  BuiltList<String>? get after;

  BuiltList<DateTime>? get calendar;

  String? get days7;

  String? get nickname;

  @BuiltValueField(wireName: 'Password')
  String? get password;

  @BuiltValueField(wireName: 'Gender')
  String? get gender;

  String? get company;

  BuiltList<DocumentReference>? get postlistref;

  DocumentReference? get postref;

  double? get price;

  String? get catergory;

  String? get birthstring;

  bool? get agreeall;

  bool? get enrollwaiting;

  bool? get enrollend;

  bool? get stop;

  DocumentReference? get proref;

  int? get birth;

  DateTime? get reservation1;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PersonRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..certificate = ListBuilder()
    ..introduce = ''
    ..after = ListBuilder()
    ..calendar = ListBuilder()
    ..days7 = ''
    ..nickname = ''
    ..password = ''
    ..gender = ''
    ..company = ''
    ..postlistref = ListBuilder()
    ..price = 0.0
    ..catergory = ''
    ..birthstring = ''
    ..agreeall = false
    ..enrollwaiting = false
    ..enrollend = false
    ..stop = false
    ..birth = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('person');

  static Stream<PersonRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PersonRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PersonRecord._();
  factory PersonRecord([void Function(PersonRecordBuilder) updates]) =
      _$PersonRecord;

  static PersonRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPersonRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? introduce,
  String? days7,
  String? nickname,
  String? password,
  String? gender,
  String? company,
  DocumentReference? postref,
  double? price,
  String? catergory,
  String? birthstring,
  bool? agreeall,
  bool? enrollwaiting,
  bool? enrollend,
  bool? stop,
  DocumentReference? proref,
  int? birth,
  DateTime? reservation1,
}) {
  final firestoreData = serializers.toFirestore(
    PersonRecord.serializer,
    PersonRecord(
      (p) => p
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..certificate = null
        ..introduce = introduce
        ..after = null
        ..calendar = null
        ..days7 = days7
        ..nickname = nickname
        ..password = password
        ..gender = gender
        ..company = company
        ..postlistref = null
        ..postref = postref
        ..price = price
        ..catergory = catergory
        ..birthstring = birthstring
        ..agreeall = agreeall
        ..enrollwaiting = enrollwaiting
        ..enrollend = enrollend
        ..stop = stop
        ..proref = proref
        ..birth = birth
        ..reservation1 = reservation1,
    ),
  );

  return firestoreData;
}
