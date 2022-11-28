import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'which_record.g.dart';

abstract class WhichRecord implements Built<WhichRecord, WhichRecordBuilder> {
  static Serializer<WhichRecord> get serializer => _$whichRecordSerializer;

  String? get add;

  String? get rUteacher;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(WhichRecordBuilder builder) => builder
    ..add = ''
    ..rUteacher = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('which');

  static Stream<WhichRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<WhichRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  WhichRecord._();
  factory WhichRecord([void Function(WhichRecordBuilder) updates]) =
      _$WhichRecord;

  static WhichRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createWhichRecordData({
  String? add,
  String? rUteacher,
}) {
  final firestoreData = serializers.toFirestore(
    WhichRecord.serializer,
    WhichRecord(
      (w) => w
        ..add = add
        ..rUteacher = rUteacher,
    ),
  );

  return firestoreData;
}
