import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'feel_set_struct.g.dart';

abstract class FeelSetStruct
    implements Built<FeelSetStruct, FeelSetStructBuilder> {
  static Serializer<FeelSetStruct> get serializer => _$feelSetStructSerializer;

  int? get feelNum;

  DateTime? get feelDay;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(FeelSetStructBuilder builder) => builder
    ..feelNum = 0
    ..firestoreUtilData = FirestoreUtilData();

  FeelSetStruct._();
  factory FeelSetStruct([void Function(FeelSetStructBuilder) updates]) =
      _$FeelSetStruct;
}

FeelSetStruct createFeelSetStruct({
  int? feelNum,
  DateTime? feelDay,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FeelSetStruct(
      (f) => f
        ..feelNum = feelNum
        ..feelDay = feelDay
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

FeelSetStruct? updateFeelSetStruct(
  FeelSetStruct? feelSet, {
  bool clearUnsetFields = true,
}) =>
    feelSet != null
        ? (feelSet.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addFeelSetStructData(
  Map<String, dynamic> firestoreData,
  FeelSetStruct? feelSet,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (feelSet == null) {
    return;
  }
  if (feelSet.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && feelSet.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final feelSetData = getFeelSetFirestoreData(feelSet, forFieldValue);
  final nestedData = feelSetData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = feelSet.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getFeelSetFirestoreData(
  FeelSetStruct? feelSet, [
  bool forFieldValue = false,
]) {
  if (feelSet == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(FeelSetStruct.serializer, feelSet);

  // Add any Firestore field values
  feelSet.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFeelSetListFirestoreData(
  List<FeelSetStruct>? feelSets,
) =>
    feelSets?.map((f) => getFeelSetFirestoreData(f, true)).toList() ?? [];
