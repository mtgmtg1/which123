import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/feel_num_widget.dart';
import '../components/messagebottomsheet_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingWidget extends StatefulWidget {
  const FloatingWidget({Key? key}) : super(key: key);

  @override
  _FloatingWidgetState createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotificationRecord>>(
      stream: queryNotificationRecord(
        queryBuilder: (notificationRecord) =>
            notificationRecord.orderBy('time_posted', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<NotificationRecord> containerNotificationRecordList =
            snapshot.data!;
        return Container(
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                child: Container(
                  width: 33,
                  height: 33,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).lineColor,
                    borderRadius: 12,
                    borderWidth: 1,
                    buttonSize: 50,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.favorite,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18,
                    ),
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: FeelNumWidget(),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                child: Container(
                  width: 33,
                  height: 33,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Badge(
                    badgeContent: Text(
                      containerNotificationRecordList.length.toString(),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            color: Colors.white,
                            fontSize: 8,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                    showBadge: true,
                    shape: BadgeShape.circle,
                    badgeColor: FlutterFlowTheme.of(context).primaryColor,
                    elevation: 4,
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    position: BadgePosition.topEnd(),
                    animationType: BadgeAnimationType.scale,
                    toAnimate: true,
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).lineColor,
                      borderRadius: 12,
                      borderWidth: 1,
                      buttonSize: 50,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.notifications_none,
                        color: FlutterFlowTheme.of(context).textColor,
                        size: 18,
                      ),
                      onPressed: () async {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: MessagebottomsheetWidget(
                                personref: currentUserReference,
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
