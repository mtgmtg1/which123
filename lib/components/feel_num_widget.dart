import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bottommessage_widget.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeelNumWidget extends StatefulWidget {
  const FeelNumWidget({Key? key}) : super(key: key);

  @override
  _FeelNumWidgetState createState() => _FeelNumWidgetState();
}

class _FeelNumWidgetState extends State<FeelNumWidget> {
  FeelsetRecord? feelset;
  int? countControllerValue;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 15, 5, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 11),
              child: SelectionArea(
                  child: Text(
                '오늘의 감정점수를 입력해주세요.',
                style: FlutterFlowTheme.of(context).title3,
              )),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                      child: FlutterFlowCountController(
                        decrementIconBuilder: (enabled) => FaIcon(
                          FontAwesomeIcons.minus,
                          color:
                              enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                          size: 22,
                        ),
                        incrementIconBuilder: (enabled) => FaIcon(
                          FontAwesomeIcons.plus,
                          color: enabled ? Colors.blue : Color(0xFFEEEEEE),
                          size: 22,
                        ),
                        countBuilder: (count) => Text(
                          count.toString(),
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                        count: countControllerValue ??= 7,
                        updateCount: (count) =>
                            setState(() => countControllerValue = count),
                        stepSize: 1,
                        minimum: 1,
                        maximum: 10,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(11, 0, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final feelsetCreateData = createFeelsetRecordData(
                        feel: valueOrDefault<int>(
                          countControllerValue,
                          10,
                        ),
                        createat: getCurrentTimestamp,
                        userref: currentUserReference,
                      );
                      var feelsetRecordReference =
                          FeelsetRecord.collection.doc();
                      await feelsetRecordReference.set(feelsetCreateData);
                      feelset = FeelsetRecord.getDocumentFromData(
                          feelsetCreateData, feelsetRecordReference);
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: BottommessageWidget(
                              title: '감정점수 기록완료',
                              txt: '오늘의 감정점수가 기록되었습니다.',
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));

                      setState(() {});
                    },
                    text: '점수 저장',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).customColor3,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).subtitle2Family,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).subtitle2Family),
                          ),
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
          ],
        ),
      ),
    );
  }
}
