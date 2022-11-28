import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'student_record.g.dart';

abstract class StudentRecord
    implements Built<StudentRecord, StudentRecordBuilder> {
  static Serializer<StudentRecord> get serializer => _$studentRecordSerializer;

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

  @BuiltValueField(wireName: 'edited_time')
  DateTime? get editedTime;

  String? get bio;

  @BuiltValueField(wireName: 'user_name')
  String? get userName;

  DocumentReference? get personref;

  BuiltList<DocumentReference>? get personlistref;

  DocumentReference? get proref;

  BuiltList<DocumentReference>? get prolistref;

  int? get price;

  bool? get stop;

  double? get workhistory;

  BuiltList<String>? get workhistorystring;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StudentRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..bio = ''
    ..userName = ''
    ..personlistref = ListBuilder()
    ..prolistref = ListBuilder()
    ..price = 0
    ..stop = false
    ..workhistory = 0.0
    ..workhistorystring = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('student');

  static Stream<StudentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StudentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StudentRecord._();
  factory StudentRecord([void Function(StudentRecordBuilder) updates]) =
      _$StudentRecord;

  static StudentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStudentRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? editedTime,
  String? bio,
  String? userName,
  DocumentReference? personref,
  DocumentReference? proref,
  int? price,
  bool? stop,
  double? workhistory,
}) {
  final firestoreData = serializers.toFirestore(
    StudentRecord.serializer,
    StudentRecord(
      (s) => s
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..editedTime = editedTime
        ..bio = bio
        ..userName = userName
        ..personref = personref
        ..personlistref = null
        ..proref = proref
        ..prolistref = null
        ..price = price
        ..stop = stop
        ..workhistory = workhistory
        ..workhistorystring = null,
    ),
  );

  return firestoreData;
}
