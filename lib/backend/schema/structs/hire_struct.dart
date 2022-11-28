import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'hire_struct.g.dart';

abstract class HireStruct implements Built<HireStruct, HireStructBuilder> {
  static Serializer<HireStruct> get serializer => _$hireStructSerializer;

  String? get title;

  String? get text;

  PeoriodStruct get peoriodSet;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(HireStructBuilder builder) => builder
    ..title = ''
    ..text = ''
    ..peoriodSet = PeoriodStructBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  HireStruct._();
  factory HireStruct([void Function(HireStructBuilder) updates]) = _$HireStruct;
}

HireStruct createHireStruct({
  String? title,
  String? text,
  PeoriodStruct? peoriodSet,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HireStruct(
      (h) => h
        ..title = title
        ..text = text
        ..peoriodSet = peoriodSet?.toBuilder() ?? PeoriodStructBuilder()
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

HireStruct? updateHireStruct(
  HireStruct? hire, {
  bool clearUnsetFields = true,
}) =>
    hire != null
        ? (hire.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addHireStructData(
  Map<String, dynamic> firestoreData,
  HireStruct? hire,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (hire == null) {
    return;
  }
  if (hire.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && hire.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final hireData = getHireFirestoreData(hire, forFieldValue);
  final nestedData = hireData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = hire.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getHireFirestoreData(
  HireStruct? hire, [
  bool forFieldValue = false,
]) {
  if (hire == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(HireStruct.serializer, hire);

  // Handle nested data for "peoriodSet" field.
  addPeoriodStructData(
      firestoreData, hire.peoriodSet, 'peoriodSet', forFieldValue);

  // Add any Firestore field values
  hire.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHireListFirestoreData(
  List<HireStruct>? hires,
) =>
    hires?.map((h) => getHireFirestoreData(h, true)).toList() ?? [];
