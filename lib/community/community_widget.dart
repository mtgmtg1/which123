import '../backend/backend.dart';
import '../components/drawer_widget.dart';
import '../components/footer_widget.dart';
import '../components/menu_widget.dart';
import '../components/navbar_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class CommunityWidget extends StatefulWidget {
  const CommunityWidget({Key? key}) : super(key: key);

  @override
  _CommunityWidgetState createState() => _CommunityWidgetState();
}

class _CommunityWidgetState extends State<CommunityWidget> {
  List<Post1Record> simpleSearchResults = [];
  TextEditingController? textController;
  String? dropDownValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().searchdone = false;
      });
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: DrawerWidget(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.18,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primaryColor,
                            FlutterFlowTheme.of(context).secondaryColor
                          ],
                          stops: [0, 1],
                          begin: AlignmentDirectional(0, -1),
                          end: AlignmentDirectional(0, 1),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(0.25, 0),
                                child: Text(
                                  '고민상담',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .title3Family,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .title3Family),
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 999,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 333,
                                  maxHeight: 66,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3, 3, 3, 0),
                                  child: Container(
                                    width: 333,
                                    child: TextFormField(
                                      controller: textController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'textController',
                                        Duration(milliseconds: 500),
                                        () => setState(() {}),
                                      ),
                                      onFieldSubmitted: (_) async {
                                        await queryPost1RecordOnce()
                                            .then(
                                              (records) => simpleSearchResults =
                                                  TextSearch(
                                                records
                                                    .map(
                                                      (record) =>
                                                          TextSearchItem(
                                                              record, [
                                                        record.title!,
                                                        record.text!,
                                                        record.postHead!,
                                                        record.whoanswer!
                                                      ]),
                                                    )
                                                    .toList(),
                                              )
                                                      .search(
                                                          textController!.text)
                                                      .map((r) => r.object)
                                                      .take(44)
                                                      .toList(),
                                            )
                                            .onError((_, __) =>
                                                simpleSearchResults = [])
                                            .whenComplete(
                                                () => setState(() {}));

                                        FFAppState().update(() {
                                          FFAppState().searchdone = true;
                                        });
                                      },
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: '검색어를 입력하세요',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                5, 5, 5, 5),
                                        suffixIcon:
                                            textController!.text.isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      textController?.clear();
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Color(0xFF757575),
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2Family),
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 3, 0, 3),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxHeight: 60,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(11),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 3, 3, 3),
                                      child: FlutterFlowDropDown<String>(
                                        options: ['전체', '가족', '이성', '진로', '기타'],
                                        onChanged: (val) =>
                                            setState(() => dropDownValue = val),
                                        width: 122,
                                        height: 44,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2Family),
                                            ),
                                        hintText: '필터 선택',
                                        fillColor: Colors.white,
                                        elevation: 2,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0,
                                        borderRadius: 0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            3, 3, 3, 3),
                                        hidesUnderline: true,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      22, 0, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed('createPost');
                                    },
                                    text: '글쓰기',
                                    icon: Icon(
                                      Icons.local_post_office_outlined,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      width: 100,
                                      height: 40,
                                      color: Color(0xA14B39EF),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family,
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2Family),
                                          ),
                                      elevation: 4,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 999,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Visibility(
                        visible: simpleSearchResults.length == 0,
                        child: StreamBuilder<List<Post1Record>>(
                          stream: queryPost1Record(),
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
                            List<Post1Record> con2MoPost1RecordList =
                                snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  con2MoPost1RecordList.length, (con2MoIndex) {
                                final con2MoPost1Record =
                                    con2MoPost1RecordList[con2MoIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 11),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'postview',
                                        queryParams: {
                                          'post': serializeParam(
                                            con2MoPost1Record,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'post': con2MoPost1Record,
                                        },
                                      );
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 999,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x2B202529),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 5, 0, 5),
                                                  child: AutoSizeText(
                                                    con2MoPost1Record.postHead!,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2Family),
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 5, 5, 5),
                                                  child: AutoSizeText(
                                                    con2MoPost1Record.title!,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title3Family,
                                                          color:
                                                              Color(0xFF1A1A1A),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .title3Family),
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(11, 11, 11, 11),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'Community');
                                                    },
                                                    child: Text(
                                                      con2MoPost1Record.text!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family,
                                                                color: Color(
                                                                    0xFF727272),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        width: 99,
                                                        height: 55,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  AutoSizeText(
                                                                con2MoPost1Record
                                                                    .whoanswer!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                '답변가능',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 1,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF7EDDE5),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 99,
                                                        height: 55,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .remove_red_eye,
                                                              color: Color(
                                                                  0xFF70CAF0),
                                                              size: 20,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                con2MoPost1Record
                                                                    .view!
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor3,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText1Family),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 999,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Builder(
                        builder: (context) {
                          final searchlist = simpleSearchResults.toList();
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(searchlist.length,
                                  (searchlistIndex) {
                                final searchlistItem =
                                    searchlist[searchlistIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'postview',
                                        queryParams: {
                                          'post': serializeParam(
                                            searchlistItem,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'post': searchlistItem,
                                        },
                                      );
                                    },
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 1222,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x2B202529),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 12),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 5),
                                                child: Text(
                                                  searchlistItem.postHead!,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 5),
                                                child: Text(
                                                  searchlistItem.title!,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 16, 16, 16),
                                                child: InkWell(
                                                  onTap: () async {
                                                    context
                                                        .pushNamed('Community');
                                                  },
                                                  child: Text(
                                                    searchlistItem.text!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF727272),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2Family),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor3,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      width: 99,
                                                      height: 55,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              searchlistItem
                                                                  .whoanswer!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF4D4D4D),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '답변가능',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF4D4D4D),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 1,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF7EDDE5),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 99,
                                                      height: 55,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .remove_red_eye,
                                                            color: Color(
                                                                0xFF70CAF0),
                                                            size: 20,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              searchlistItem
                                                                  .view!
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF70CAF0),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 55, 0, 55),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 111),
                          child: FooterWidget(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: MenuWidget(
                drawer: () async {},
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
                      c2: FlutterFlowTheme.of(context).primaryColor,
                      c3: FlutterFlowTheme.of(context).primaryBackground,
                      c4: FlutterFlowTheme.of(context).secondaryText,
                      c5: FlutterFlowTheme.of(context).secondaryText,
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
