import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'dayreservation_struct.g.dart';

abstract class DayreservationStruct
    implements Built<DayreservationStruct, DayreservationStructBuilder> {
  static Serializer<DayreservationStruct> get serializer =>
      _$dayreservationStructSerializer;

  BuiltList<DateTime>? get m01;

  BuiltList<DateTime>? get m02;

  BuiltList<DateTime>? get m03;

  BuiltList<DateTime>? get reservations;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(DayreservationStructBuilder builder) => builder
    ..m01 = ListBuilder()
    ..m02 = ListBuilder()
    ..m03 = ListBuilder()
    ..reservations = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  DayreservationStruct._();
  factory DayreservationStruct(
          [void Function(DayreservationStructBuilder) updates]) =
      _$DayreservationStruct;
}

DayreservationStruct createDayreservationStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DayreservationStruct(
      (d) => d
        ..m01 = null
        ..m02 = null
        ..m03 = null
        ..reservations = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

DayreservationStruct? updateDayreservationStruct(
  DayreservationStruct? dayreservation, {
  bool clearUnsetFields = true,
}) =>
    dayreservation != null
        ? (dayreservation.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addDayreservationStructData(
  Map<String, dynamic> firestoreData,
  DayreservationStruct? dayreservation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dayreservation == null) {
    return;
  }
  if (dayreservation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && dayreservation.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dayreservationData =
      getDayreservationFirestoreData(dayreservation, forFieldValue);
  final nestedData =
      dayreservationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = dayreservation.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getDayreservationFirestoreData(
  DayreservationStruct? dayreservation, [
  bool forFieldValue = false,
]) {
  if (dayreservation == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(DayreservationStruct.serializer, dayreservation);

  // Add any Firestore field values
  dayreservation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDayreservationListFirestoreData(
  List<DayreservationStruct>? dayreservations,
) =>
    dayreservations
        ?.map((d) => getDayreservationFirestoreData(d, true))
        .toList() ??
    [];
