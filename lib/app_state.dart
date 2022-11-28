import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _postref = (await secureStorage.getString('ff_postref'))?.ref ?? _postref;
    _imageref = await secureStorage.getString('ff_imageref') ?? _imageref;
    _priceref =
        (await secureStorage.getString('ff_priceref'))?.ref ?? _priceref;
    _personref =
        (await secureStorage.getString('ff_personref'))?.ref ?? _personref;
    _mypersonref =
        (await secureStorage.getString('ff_mypersonref'))?.ref ?? _mypersonref;
    _yourpersonref = (await secureStorage.getString('ff_yourpersonref'))?.ref ??
        _yourpersonref;
    _feeldaycate =
        await secureStorage.getString('ff_feeldaycate') ?? _feeldaycate;
  }

  late FlutterSecureStorage secureStorage;

  DocumentReference? _postref;
  DocumentReference? get postref => _postref;
  set postref(DocumentReference? _value) {
    if (_value == null) {
      return;
    }
    _postref = _value;
    secureStorage.setString('ff_postref', _value.path);
  }

  void deletePostref() {
    secureStorage.delete(key: 'ff_postref');
  }

  String _imageref = '';
  String get imageref => _imageref;
  set imageref(String _value) {
    _imageref = _value;
    secureStorage.setString('ff_imageref', _value);
  }

  void deleteImageref() {
    secureStorage.delete(key: 'ff_imageref');
  }

  DocumentReference? _priceref;
  DocumentReference? get priceref => _priceref;
  set priceref(DocumentReference? _value) {
    if (_value == null) {
      return;
    }
    _priceref = _value;
    secureStorage.setString('ff_priceref', _value.path);
  }

  void deletePriceref() {
    secureStorage.delete(key: 'ff_priceref');
  }

  DocumentReference? _personref;
  DocumentReference? get personref => _personref;
  set personref(DocumentReference? _value) {
    if (_value == null) {
      return;
    }
    _personref = _value;
    secureStorage.setString('ff_personref', _value.path);
  }

  void deletePersonref() {
    secureStorage.delete(key: 'ff_personref');
  }

  DocumentReference? _mypersonref;
  DocumentReference? get mypersonref => _mypersonref;
  set mypersonref(DocumentReference? _value) {
    if (_value == null) {
      return;
    }
    _mypersonref = _value;
    secureStorage.setString('ff_mypersonref', _value.path);
  }

  void deleteMypersonref() {
    secureStorage.delete(key: 'ff_mypersonref');
  }

  DocumentReference? _yourpersonref;
  DocumentReference? get yourpersonref => _yourpersonref;
  set yourpersonref(DocumentReference? _value) {
    if (_value == null) {
      return;
    }
    _yourpersonref = _value;
    secureStorage.setString('ff_yourpersonref', _value.path);
  }

  void deleteYourpersonref() {
    secureStorage.delete(key: 'ff_yourpersonref');
  }

  bool searchdone = false;

  bool selectedfeel = false;

  String _feeldaycate = '일별';
  String get feeldaycate => _feeldaycate;
  set feeldaycate(String _value) {
    _feeldaycate = _value;
    secureStorage.setString('ff_feeldaycate', _value);
  }

  void deleteFeeldaycate() {
    secureStorage.delete(key: 'ff_feeldaycate');
  }

  String reservemonthday = '';

  String reservehour = '';

  int price = 0;

  String feelmonthdaynumber = '';

  int selectednum = 0;
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
