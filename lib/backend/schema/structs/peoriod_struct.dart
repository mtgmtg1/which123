import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'peoriod_struct.g.dart';

abstract class PeoriodStruct
    implements Built<PeoriodStruct, PeoriodStructBuilder> {
  static Serializer<PeoriodStruct> get serializer => _$peoriodStructSerializer;

  BuiltList<DateTime>? get peoriod;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(PeoriodStructBuilder builder) => builder
    ..peoriod = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  PeoriodStruct._();
  factory PeoriodStruct([void Function(PeoriodStructBuilder) updates]) =
      _$PeoriodStruct;
}

PeoriodStruct createPeoriodStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PeoriodStruct(
      (p) => p
        ..peoriod = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

PeoriodStruct? updatePeoriodStruct(
  PeoriodStruct? peoriod, {
  bool clearUnsetFields = true,
}) =>
    peoriod != null
        ? (peoriod.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addPeoriodStructData(
  Map<String, dynamic> firestoreData,
  PeoriodStruct? peoriod,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (peoriod == null) {
    return;
  }
  if (peoriod.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && peoriod.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final peoriodData = getPeoriodFirestoreData(peoriod, forFieldValue);
  final nestedData = peoriodData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = peoriod.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getPeoriodFirestoreData(
  PeoriodStruct? peoriod, [
  bool forFieldValue = false,
]) {
  if (peoriod == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(PeoriodStruct.serializer, peoriod);

  // Add any Firestore field values
  peoriod.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPeoriodListFirestoreData(
  List<PeoriodStruct>? peoriods,
) =>
    peoriods?.map((p) => getPeoriodFirestoreData(p, true)).toList() ?? [];
