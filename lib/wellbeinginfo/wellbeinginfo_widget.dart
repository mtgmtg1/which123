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
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class WellbeinginfoWidget extends StatefulWidget {
  const WellbeinginfoWidget({Key? key}) : super(key: key);

  @override
  _WellbeinginfoWidgetState createState() => _WellbeinginfoWidgetState();
}

class _WellbeinginfoWidgetState extends State<WellbeinginfoWidget> {
  List<CompanyRecord> simpleSearchResults = [];
  TextEditingController? textController;
  String? dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().searchdone = false);
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
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        elevation: 16,
        child: DrawerWidget(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 100,
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
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 100,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.25, 0),
                              child: Text(
                                '복지정보',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    tablet: false,
                  ))
                    Container(
                      width: MediaQuery.of(context).size.width,
                      constraints: BoxConstraints(
                        maxWidth: 999,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                constraints: BoxConstraints(
                                  maxWidth: 999,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 10, 15, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: FlutterFlowDropDown<String>(
                                        initialOption: dropDownValue ??= '전체',
                                        options: [
                                          '아동복지',
                                          '청소년복지',
                                          '청년복지',
                                          '노인복지',
                                          '장애아동복지',
                                          '장애인복지',
                                          'ngo단체',
                                          '복지정책',
                                          '전체'
                                        ],
                                        onChanged: (val) =>
                                            setState(() => dropDownValue = val),
                                        width: 100,
                                        height: 40,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2Family),
                                            ),
                                        hintText: '카테고리',
                                        fillColor: Colors.white,
                                        elevation: 2,
                                        borderColor: Color(0xFF8DDDFF),
                                        borderWidth: 2,
                                        borderRadius: 10,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        hidesUnderline: true,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: TextFormField(
                                          controller: textController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            'textController',
                                            Duration(milliseconds: 500),
                                            () async {
                                              await queryCompanyRecordOnce()
                                                  .then(
                                                    (records) =>
                                                        simpleSearchResults =
                                                            TextSearch(
                                                      records
                                                          .map(
                                                            (record) =>
                                                                TextSearchItem(
                                                                    record, [
                                                              record.homepage!,
                                                              record.introduce!,
                                                              record.kids!,
                                                              record
                                                                  .kidsdetail!,
                                                              record.place!,
                                                              record
                                                                  .placedetail!,
                                                              record
                                                                  .officecatergory!,
                                                              record
                                                                  .officename!,
                                                              record.address!,
                                                              record.phone!,
                                                              record.fax!
                                                            ]),
                                                          )
                                                          .toList(),
                                                    )
                                                                .search(
                                                                    textController!
                                                                        .text)
                                                                .map((r) =>
                                                                    r.object)
                                                                .toList(),
                                                  )
                                                  .onError((_, __) =>
                                                      simpleSearchResults = [])
                                                  .whenComplete(
                                                      () => setState(() {}));

                                              setState(() => FFAppState()
                                                  .searchdone = true);
                                            },
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '검색어입력',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF707070),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF707070),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            ),
                                            suffixIcon:
                                                textController!.text.isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          textController
                                                              ?.clear();
                                                          await queryCompanyRecordOnce()
                                                              .then(
                                                                (records) => simpleSearchResults =
                                                                    TextSearch(
                                                                  records
                                                                      .map(
                                                                        (record) => TextSearchItem(
                                                                            record,
                                                                            [
                                                                              record.homepage!,
                                                                              record.introduce!,
                                                                              record.kids!,
                                                                              record.kidsdetail!,
                                                                              record.place!,
                                                                              record.placedetail!,
                                                                              record.officecatergory!,
                                                                              record.officename!,
                                                                              record.address!,
                                                                              record.phone!,
                                                                              record.fax!
                                                                            ]),
                                                                      )
                                                                      .toList(),
                                                                )
                                                                        .search(textController!
                                                                            .text)
                                                                        .map((r) =>
                                                                            r.object)
                                                                        .toList(),
                                                              )
                                                              .onError((_,
                                                                      __) =>
                                                                  simpleSearchResults =
                                                                      [])
                                                              .whenComplete(() =>
                                                                  setState(
                                                                      () {}));

                                                          setState(() =>
                                                              FFAppState()
                                                                      .searchdone =
                                                                  true);
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color:
                                                              Color(0xFF757575),
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
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .subtitle2Family),
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (FFAppState().searchdone == false)
                                StreamBuilder<List<CompanyRecord>>(
                                  stream: queryCompanyRecord(),
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
                                    List<CompanyRecord>
                                        columnCompanyRecordList =
                                        snapshot.data!;
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            columnCompanyRecordList.length,
                                            (columnIndex) {
                                          final columnCompanyRecord =
                                              columnCompanyRecordList[
                                                  columnIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 12, 16, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await launchURL(
                                                    columnCompanyRecord
                                                        .homepage!);
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.77,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 999,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.asset(
                                                        'assets/images/login_N_joinBG_wide.png',
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 100,
                                                              height: 32,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x9961DEFF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          16),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          16),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0),
                                                                ),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Text(
                                                                'NEW Contents',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
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
                                                        ClipRRect(
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                              sigmaX: 4,
                                                              sigmaY: 5,
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            12,
                                                                            12,
                                                                            12),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        columnCompanyRecord
                                                                            .officecatergory!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title3
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).title3Family,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).title3Family),
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          columnCompanyRecord
                                                                              .officename!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .title3
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).title3Family,
                                                                                color: FlutterFlowTheme.of(context).main1,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FontStyle.italic,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).title3Family),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                8,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              columnCompanyRecord.kids!,
                                                                              style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FontStyle.italic,
                                                                                    decoration: TextDecoration.underline,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                8,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              columnCompanyRecord.kidsdetail!,
                                                                              style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FontStyle.italic,
                                                                                    decoration: TextDecoration.underline,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                12,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              columnCompanyRecord.place!,
                                                                              style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                12,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              columnCompanyRecord.placedetail!,
                                                                              style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  context.pushNamed(
                                                                                    'wellbeingview',
                                                                                    queryParams: {
                                                                                      'companyref': serializeParam(
                                                                                        columnCompanyRecord,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'companyref': columnCompanyRecord,
                                                                                    },
                                                                                  );
                                                                                },
                                                                                text: '정보 더보기 ',
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 50,
                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                      ),
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await launchURL(columnCompanyRecord.homepage!);
                                                                                },
                                                                                text: '홈페이지',
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 50,
                                                                                  color: Color(0xFF8DDDFF),
                                                                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                      ),
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                              if (FFAppState().searchdone == true)
                                Builder(
                                  builder: (context) {
                                    final searchlist =
                                        simpleSearchResults.toList();
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(searchlist.length,
                                                (searchlistIndex) {
                                          final searchlistItem =
                                              searchlist[searchlistIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 12, 16, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await launchURL(
                                                    searchlistItem.homepage!);
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.77,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 999,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.asset(
                                                        'assets/images/login_N_joinBG_wide.png',
                                                      ).image,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 5,
                                                        color:
                                                            Color(0x230E151B),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 100,
                                                              height: 32,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x9961DEFF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          16),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          16),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0),
                                                                ),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Text(
                                                                'NEW Contents',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
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
                                                        ClipRRect(
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                              sigmaX: 4,
                                                              sigmaY: 5,
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          16),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          16),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            12,
                                                                            12,
                                                                            12),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        searchlistItem
                                                                            .officecatergory!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title3
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).title3Family,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).title3Family),
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          searchlistItem
                                                                              .officename!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .title3
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).title3Family,
                                                                                color: FlutterFlowTheme.of(context).main1,
                                                                                fontStyle: FontStyle.italic,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).title3Family),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                8,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              searchlistItem.kids!,
                                                                              style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                    fontStyle: FontStyle.italic,
                                                                                    decoration: TextDecoration.underline,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                8,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              searchlistItem.kidsdetail!,
                                                                              style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                    fontStyle: FontStyle.italic,
                                                                                    decoration: TextDecoration.underline,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                12,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              searchlistItem.place!,
                                                                              style: FlutterFlowTheme.of(context).subtitle2,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                12,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              searchlistItem.placedetail!,
                                                                              style: FlutterFlowTheme.of(context).subtitle2,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  context.pushNamed(
                                                                                    'wellbeingview',
                                                                                    queryParams: {
                                                                                      'companyref': serializeParam(
                                                                                        searchlistItem,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'companyref': searchlistItem,
                                                                                    },
                                                                                  );
                                                                                },
                                                                                text: '정보 더보기 ',
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 50,
                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                      ),
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await launchURL(searchlistItem.homepage!);
                                                                                },
                                                                                text: '홈페이지',
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 50,
                                                                                  color: Color(0xFF8DDDFF),
                                                                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                      ),
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 55),
                    child: FooterWidget(),
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
                child: MenuWidget(
                  drawer: () async {},
                ),
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
                      c4: FlutterFlowTheme.of(context).primaryColor,
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
