import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'reply_sets_struct.g.dart';

abstract class ReplySetsStruct
    implements Built<ReplySetsStruct, ReplySetsStructBuilder> {
  static Serializer<ReplySetsStruct> get serializer =>
      _$replySetsStructSerializer;

  BuiltList<String>? get replyText;

  String? get replyId;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ReplySetsStructBuilder builder) => builder
    ..replyText = ListBuilder()
    ..replyId = ''
    ..firestoreUtilData = FirestoreUtilData();

  ReplySetsStruct._();
  factory ReplySetsStruct([void Function(ReplySetsStructBuilder) updates]) =
      _$ReplySetsStruct;
}

ReplySetsStruct createReplySetsStruct({
  String? replyId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReplySetsStruct(
      (r) => r
        ..replyText = null
        ..replyId = replyId
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ReplySetsStruct? updateReplySetsStruct(
  ReplySetsStruct? replySets, {
  bool clearUnsetFields = true,
}) =>
    replySets != null
        ? (replySets.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addReplySetsStructData(
  Map<String, dynamic> firestoreData,
  ReplySetsStruct? replySets,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (replySets == null) {
    return;
  }
  if (replySets.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && replySets.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final replySetsData = getReplySetsFirestoreData(replySets, forFieldValue);
  final nestedData = replySetsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = replySets.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getReplySetsFirestoreData(
  ReplySetsStruct? replySets, [
  bool forFieldValue = false,
]) {
  if (replySets == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ReplySetsStruct.serializer, replySets);

  // Add any Firestore field values
  replySets.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReplySetsListFirestoreData(
  List<ReplySetsStruct>? replySetss,
) =>
    replySetss?.map((r) => getReplySetsFirestoreData(r, true)).toList() ?? [];
