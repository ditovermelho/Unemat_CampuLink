import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'group_view_model.dart';
export 'group_view_model.dart';

class GroupViewWidget extends StatefulWidget {
  const GroupViewWidget({
    Key? key,
    required this.refgroup,
  }) : super(key: key);

  final DocumentReference? refgroup;

  @override
  _GroupViewWidgetState createState() => _GroupViewWidgetState();
}

class _GroupViewWidgetState extends State<GroupViewWidget> {
  late GroupViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Detalhes do grupo',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).info,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 0.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.close,
              color: FlutterFlowTheme.of(context).info,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('home');
            },
          ),
        ],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: StreamBuilder<GroupRecord>(
        stream: GroupRecord.getDocument(widget.refgroup!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          final columnMainContentGroupRecord = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      columnMainContentGroupRecord.groupPhoto,
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 230.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        columnMainContentGroupRecord.groupName,
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                        child: StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(
                              columnMainContentGroupRecord.groupCreator!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final richTextUsersRecord = snapshot.data!;
                            return RichText(
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Cirado ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  TextSpan(
                                    text: 'por ',
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text:
                                        columnMainContentGroupRecord.groupName,
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: ' no dia ',
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: dateTimeFormat(
                                        'd/M/y',
                                        columnMainContentGroupRecord
                                            .groupCreatedTime!),
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        columnMainContentGroupRecord.groupDescrision,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Membros',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                  child: StreamBuilder<List<GruopMebresRecord>>(
                    stream: queryGruopMebresRecord(
                      queryBuilder: (gruopMebresRecord) =>
                          gruopMebresRecord.where(
                        'group_ref',
                        isEqualTo: widget.refgroup,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<GruopMebresRecord>
                          groupMembresGruopMebresRecordList = snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              groupMembresGruopMebresRecordList.length,
                              (groupMembresIndex) {
                            final groupMembresGruopMebresRecord =
                                groupMembresGruopMebresRecordList[
                                    groupMembresIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 0.0, 12.0),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    groupMembresGruopMebresRecord.userRef!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final friend1UsersRecord = snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 65.0,
                                        height: 65.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 4.0, 4.0, 4.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.search =
                                                  await queryConnectionsRecordOnce(
                                                queryBuilder:
                                                    (connectionsRecord) =>
                                                        connectionsRecord
                                                            .where(
                                                              'user_ref',
                                                              isEqualTo:
                                                                  currentUserReference,
                                                            )
                                                            .where(
                                                              'other_user',
                                                              isEqualTo:
                                                                  friend1UsersRecord
                                                                      .reference,
                                                            ),
                                              );
                                              if (_model.search?.length !=
                                                  null) {
                                                context.pushNamed(
                                                  'profile_another_use_stop_follow',
                                                  queryParameters: {
                                                    'refUser': serializeParam(
                                                      friend1UsersRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'connecref': serializeParam(
                                                      _model.search?.first
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  'profile_another_use_follow',
                                                  queryParameters: {
                                                    'refUser': serializeParam(
                                                      friend1UsersRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }

                                              setState(() {});
                                            },
                                            child: Container(
                                              width: 70.0,
                                              height: 70.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                friend1UsersRecord.photoUrl,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          friend1UsersRecord.displayName,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 24.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var gruopMebresRecordReference =
                            GruopMebresRecord.collection.doc();
                        await gruopMebresRecordReference
                            .set(createGruopMebresRecordData(
                          groupRef: widget.refgroup,
                          userRef: currentUserReference,
                        ));
                        _model.result = GruopMebresRecord.getDocumentFromData(
                            createGruopMebresRecordData(
                              groupRef: widget.refgroup,
                              userRef: currentUserReference,
                            ),
                            gruopMebresRecordReference);

                        context.pushNamed(
                          'group',
                          queryParameters: {
                            'refGroup': serializeParam(
                              widget.refgroup,
                              ParamType.DocumentReference,
                            ),
                            'member': serializeParam(
                              _model.result?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );

                        setState(() {});
                      },
                      text: 'Entrar para o Grupo',
                      options: FFButtonOptions(
                        width: 300.0,
                        height: 60.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
