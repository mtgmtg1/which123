import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/navbar_widget.dart';
import '../components/profil_menu_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';

class ProenrollWidget extends StatefulWidget {
  const ProenrollWidget({Key? key}) : super(key: key);

  @override
  _ProenrollWidgetState createState() => _ProenrollWidgetState();
}

class _ProenrollWidgetState extends State<ProenrollWidget> {
  bool isMediaUploading1 = false;
  String uploadedFileUrl1 = '';

  TextEditingController? introController;
  TextEditingController? emailAddressController;
  TextEditingController? userNameController;
  bool isMediaUploading2 = false;
  String uploadedFileUrl2 = '';

  TextEditingController? companyController;
  TextEditingController? workhistoryController;
  String? dropDowngenderValue;
  String? procategoryValue;
  TextEditingController? phoneController;
  bool isMediaUploading3 = false;
  String uploadedFileUrl3 = '';

  TextEditingController? cert1Controller;
  bool isMediaUploading4 = false;
  String uploadedFileUrl4 = '';

  TextEditingController? cert2Controller;
  bool isMediaUploading5 = false;
  String uploadedFileUrl5 = '';

  TextEditingController? cert3Controller;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    cert1Controller = TextEditingController();
    cert2Controller = TextEditingController();
    cert3Controller = TextEditingController();
    companyController = TextEditingController();
    workhistoryController = TextEditingController();
    introController = TextEditingController();
    userNameController = TextEditingController();
    phoneController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    cert1Controller?.dispose();
    cert2Controller?.dispose();
    cert3Controller?.dispose();
    companyController?.dispose();
    workhistoryController?.dispose();
    emailAddressController?.dispose();
    userNameController?.dispose();
    introController?.dispose();
    phoneController?.dispose();
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.18,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 66),
                        child: AuthUserStreamWidget(
                          child: FutureBuilder<ProRecord>(
                            future: ProRecord.getDocumentOnce(
                                currentUserDocument!.proref!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              final containerProRecord = snapshot.data!;
                              return Container(
                                constraints: BoxConstraints(
                                  maxWidth: 1111,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 44, 0, 0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.44,
                                          constraints: BoxConstraints(
                                            maxWidth: 222,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 6,
                                                color: Color(0x3A000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 22, 0, 0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 5, 5, 5),
                                                    child: Text(
                                                      '사진등록',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                fontSize: 22,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      final selectedMedia =
                                                          await selectMediaWithSourceBottomSheet(
                                                        context: context,
                                                        maxWidth: 999.00,
                                                        imageQuality: 89,
                                                        allowPhoto: true,
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        setState(() =>
                                                            isMediaUploading1 =
                                                                true);
                                                        var downloadUrls =
                                                            <String>[];
                                                        try {
                                                          showUploadMessage(
                                                            context,
                                                            'Uploading file...',
                                                            showLoading: true,
                                                          );
                                                          downloadUrls =
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .hideCurrentSnackBar();
                                                          isMediaUploading1 =
                                                              false;
                                                        }
                                                        if (downloadUrls
                                                                .length ==
                                                            selectedMedia
                                                                .length) {
                                                          setState(() =>
                                                              uploadedFileUrl1 =
                                                                  downloadUrls
                                                                      .first);
                                                          showUploadMessage(
                                                              context,
                                                              'Success!');
                                                        } else {
                                                          setState(() {});
                                                          showUploadMessage(
                                                              context,
                                                              'Failed to upload media');
                                                          return;
                                                        }
                                                      }
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              11),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          uploadedFileUrl1,
                                                          'https://play-lh.googleusercontent.com/38AGKCqmbjZ9OuWx4YjssAz3Y0DTWbiM5HB0ove1pNBq_o9mtWfGszjZNxZdwt_vgHo=w480-h960-rw',
                                                        ),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            11, 11, 11, 11),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.22,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    22, 22, 22, 22),
                                            child: TextFormField(
                                              controller: introController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    containerProRecord.intro,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            20, 32, 20, 12),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                              textAlign: TextAlign.start,
                                              maxLines: 4,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return '필수항목입니다.';
                                                }

                                                if (val.length < 20) {
                                                  return 'Requires at least 20 characters.';
                                                }
                                                if (val.length > 200) {
                                                  return 'Maximum 200 characters allowed, currently ${val.length}.';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller:
                                                  emailAddressController ??=
                                                      TextEditingController(
                                                text: containerProRecord.email,
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: '이메일',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            20, 32, 20, 12),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return '필수항목입니다.';
                                                }

                                                if (!RegExp(
                                                        kTextValidatorEmailRegex)
                                                    .hasMatch(val)) {
                                                  return 'Has to be a valid email address.';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller: userNameController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: '이름',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            20, 32, 20, 12),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              textAlign: TextAlign.center,
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return '필수항목입니다.';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                        indent: 11,
                                        endIndent: 11,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: workhistoryController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: '경력기간',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            20, 32, 20, 12),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return '필수항목입니다.';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: TextFormField(
                                                controller: companyController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: '현재 직장/학교',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              20, 32, 20, 12),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 5, 5, 5),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final selectedFile =
                                                        await selectFile(
                                                            allowedExtensions: [
                                                          'pdf'
                                                        ]);
                                                    if (selectedFile != null) {
                                                      setState(() =>
                                                          isMediaUploading2 =
                                                              true);
                                                      String? downloadUrl;
                                                      try {
                                                        showUploadMessage(
                                                          context,
                                                          'Uploading file...',
                                                          showLoading: true,
                                                        );
                                                        downloadUrl =
                                                            await uploadData(
                                                                selectedFile
                                                                    .storagePath,
                                                                selectedFile
                                                                    .bytes);
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        isMediaUploading2 =
                                                            false;
                                                      }
                                                      if (downloadUrl != null) {
                                                        setState(() =>
                                                            uploadedFileUrl2 =
                                                                downloadUrl!);
                                                        showUploadMessage(
                                                          context,
                                                          'Success!',
                                                        );
                                                      } else {
                                                        setState(() {});
                                                        showUploadMessage(
                                                          context,
                                                          'Failed to upload file',
                                                        );
                                                        return;
                                                      }
                                                    }
                                                  },
                                                  text: '재직/재학증명서 업로드',
                                                  options: FFButtonOptions(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor3,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2Family,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2Family),
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                        indent: 11,
                                        endIndent: 11,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(11),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Container(
                                                      width: 133,
                                                      child: TextFormField(
                                                        controller:
                                                            phoneController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: '전화번호',
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      5, 5, 5),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                        textAlign:
                                                            TextAlign.center,
                                                        keyboardType:
                                                            TextInputType.phone,
                                                        validator: (val) {
                                                          if (val == null ||
                                                              val.isEmpty) {
                                                            return '필수항목입니다.';
                                                          }

                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -0.1, 0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      options: [
                                                        '전문상담사',
                                                        '대학생상담사'
                                                      ],
                                                      onChanged: (val) =>
                                                          setState(() =>
                                                              procategoryValue =
                                                                  val),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: Colors
                                                                    .black,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                      hintText: '회원구분선택',
                                                      elevation: 2,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0,
                                                      borderRadius: 0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 4, 12, 4),
                                                      hidesUnderline: true,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                ),
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  options: ['선택안함', '남성', '여성'],
                                                  onChanged: (val) => setState(
                                                      () =>
                                                          dropDowngenderValue =
                                                              val),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.22,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1,
                                                  hintText: '성별',
                                                  elevation: 2,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0,
                                                  borderRadius: 0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(12, 4, 12, 4),
                                                  hidesUnderline: true,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                        indent: 11,
                                        endIndent: 11,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    TextFormField(
                                                      controller:
                                                          cert1Controller,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    32, 20, 12),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                      textAlign:
                                                          TextAlign.start,
                                                      validator: (val) {
                                                        if (val == null ||
                                                            val.isEmpty) {
                                                          return '필수항목입니다.';
                                                        }

                                                        return null;
                                                      },
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      indent: 11,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 5, 5, 5),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          final selectedFile =
                                                              await selectFile(
                                                                  allowedExtensions: [
                                                                'pdf'
                                                              ]);
                                                          if (selectedFile !=
                                                              null) {
                                                            setState(() =>
                                                                isMediaUploading3 =
                                                                    true);
                                                            String? downloadUrl;
                                                            try {
                                                              showUploadMessage(
                                                                context,
                                                                'Uploading file...',
                                                                showLoading:
                                                                    true,
                                                              );
                                                              downloadUrl = await uploadData(
                                                                  selectedFile
                                                                      .storagePath,
                                                                  selectedFile
                                                                      .bytes);
                                                            } finally {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .hideCurrentSnackBar();
                                                              isMediaUploading3 =
                                                                  false;
                                                            }
                                                            if (downloadUrl !=
                                                                null) {
                                                              setState(() =>
                                                                  uploadedFileUrl3 =
                                                                      downloadUrl!);
                                                              showUploadMessage(
                                                                context,
                                                                'Success!',
                                                              );
                                                            } else {
                                                              setState(() {});
                                                              showUploadMessage(
                                                                context,
                                                                'Failed to upload file',
                                                              );
                                                              return;
                                                            }
                                                          }
                                                        },
                                                        text: '증명서 업로드',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130,
                                                          height: 40,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family,
                                                                    color: Colors
                                                                        .white,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).subtitle2Family),
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    TextFormField(
                                                      controller:
                                                          cert2Controller,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    32, 20, 12),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 5, 5, 5),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          final selectedFile =
                                                              await selectFile(
                                                                  allowedExtensions: [
                                                                'pdf'
                                                              ]);
                                                          if (selectedFile !=
                                                              null) {
                                                            setState(() =>
                                                                isMediaUploading4 =
                                                                    true);
                                                            String? downloadUrl;
                                                            try {
                                                              showUploadMessage(
                                                                context,
                                                                'Uploading file...',
                                                                showLoading:
                                                                    true,
                                                              );
                                                              downloadUrl = await uploadData(
                                                                  selectedFile
                                                                      .storagePath,
                                                                  selectedFile
                                                                      .bytes);
                                                            } finally {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .hideCurrentSnackBar();
                                                              isMediaUploading4 =
                                                                  false;
                                                            }
                                                            if (downloadUrl !=
                                                                null) {
                                                              setState(() =>
                                                                  uploadedFileUrl4 =
                                                                      downloadUrl!);
                                                              showUploadMessage(
                                                                context,
                                                                'Success!',
                                                              );
                                                            } else {
                                                              setState(() {});
                                                              showUploadMessage(
                                                                context,
                                                                'Failed to upload file',
                                                              );
                                                              return;
                                                            }
                                                          }
                                                        },
                                                        text: '증명서 업로드',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130,
                                                          height: 40,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family,
                                                                    color: Colors
                                                                        .white,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).subtitle2Family),
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    TextFormField(
                                                      controller:
                                                          cert3Controller,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    32, 20, 12),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      endIndent: 11,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 5, 5, 5),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          final selectedFile =
                                                              await selectFile(
                                                                  allowedExtensions: [
                                                                'pdf'
                                                              ]);
                                                          if (selectedFile !=
                                                              null) {
                                                            setState(() =>
                                                                isMediaUploading5 =
                                                                    true);
                                                            String? downloadUrl;
                                                            try {
                                                              showUploadMessage(
                                                                context,
                                                                'Uploading file...',
                                                                showLoading:
                                                                    true,
                                                              );
                                                              downloadUrl = await uploadData(
                                                                  selectedFile
                                                                      .storagePath,
                                                                  selectedFile
                                                                      .bytes);
                                                            } finally {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .hideCurrentSnackBar();
                                                              isMediaUploading5 =
                                                                  false;
                                                            }
                                                            if (downloadUrl !=
                                                                null) {
                                                              setState(() =>
                                                                  uploadedFileUrl5 =
                                                                      downloadUrl!);
                                                              showUploadMessage(
                                                                context,
                                                                'Success!',
                                                              );
                                                            } else {
                                                              setState(() {});
                                                              showUploadMessage(
                                                                context,
                                                                'Failed to upload file',
                                                              );
                                                              return;
                                                            }
                                                          }
                                                        },
                                                        text: '증명서 업로드',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130,
                                                          height: 40,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family,
                                                                    color: Colors
                                                                        .white,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).subtitle2Family),
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            11, 11, 11, 11),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 111),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  final proCreateData = {
                                                    ...createProRecordData(
                                                      proName:
                                                          userNameController!
                                                              .text,
                                                      proInfo:
                                                          workhistoryController!
                                                              .text,
                                                      intro: companyController!
                                                          .text,
                                                      img: uploadedFileUrl1,
                                                      workhistory:
                                                          containerProRecord
                                                              .workhistory,
                                                      personref:
                                                          currentUserReference,
                                                      enrollwaiting: true,
                                                      nowactive: false,
                                                      createat:
                                                          getCurrentTimestamp,
                                                      catergory:
                                                          procategoryValue,
                                                      gender:
                                                          dropDowngenderValue,
                                                      phone:
                                                          phoneController!.text,
                                                      email:
                                                          emailAddressController
                                                                  ?.text ??
                                                              '',
                                                      secondcertification:
                                                          cert2Controller!.text,
                                                      thirdcertification:
                                                          cert3Controller!.text,
                                                    ),
                                                    'company': [
                                                      companyController!.text
                                                    ],
                                                  };
                                                  await ProRecord.collection
                                                      .doc()
                                                      .set(proCreateData);

                                                  final personUpdateData =
                                                      createPersonRecordData(
                                                    enrollwaiting: true,
                                                  );
                                                  await currentUserReference!
                                                      .update(personUpdateData);
                                                },
                                                text: '등록신청',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: Color(0xCFFFBC42),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .subtitle2
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family,
                                                            color: Colors.white,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2Family),
                                                          ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              elevation: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: ProfilMenuWidget(),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: Container(
                  height: 75,
                  decoration: BoxDecoration(),
                  child: Visibility(
                    visible: !(isWeb
                            ? MediaQuery.of(context).viewInsets.bottom > 0
                            : _isKeyboardVisible) &&
                        responsiveVisibility(
                          context: context,
                          desktop: false,
                        ),
                    child: NavbarWidget(
                      c1: FlutterFlowTheme.of(context).secondaryText,
                      c2: FlutterFlowTheme.of(context).secondaryText,
                      c3: FlutterFlowTheme.of(context).primaryBackground,
                      c4: FlutterFlowTheme.of(context).secondaryText,
                      c5: FlutterFlowTheme.of(context).primaryColor,
                      c12: FlutterFlowTheme.of(context).secondaryText,
                      c45: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
