import 'package:ekran/core/models/auth/auth_credentials.dart';
import 'package:ekran/core/models/auth/school_user.dart';

enum AuthenticatStatuses { UnknownSessionState, Unauthenticated, Authenticated }

class SessionState {
  SchoolUser? schoolUser;
  AuthenticatStatuses authenticatStatus;
  AuthCredentials? authCredentials;
  String? authToken;
  String? userID;

  SessionState(
      {this.authenticatStatus = AuthenticatStatuses.UnknownSessionState,
      this.authCredentials,
      this.schoolUser,
      this.authToken,
      this.userID});

  SessionState copyWith(
      {AuthenticatStatuses? authenticatStatus, AuthCredentials? authCredentials,SchoolUser? schoolUser, String? authToken, String? userID}) {
    return SessionState(
        authenticatStatus: authenticatStatus ?? this.authenticatStatus,
        authCredentials: authCredentials ?? this.authCredentials,
        schoolUser: schoolUser ?? this.schoolUser,
        authToken: authToken ?? this.authToken,
        userID: userID ?? this.userID);
  }
}
