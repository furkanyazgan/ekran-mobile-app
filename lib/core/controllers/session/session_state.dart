import 'package:ekran/core/models/auth/auth_credentials.dart';

enum AuthenticatStatuses { UnknownSessionState, Unauthenticated, Authenticated }

class SessionState {
  AuthenticatStatuses authenticatStatus;
  AuthCredentials? authCredentials;
  String? authToken;

  SessionState(
      {this.authenticatStatus = AuthenticatStatuses.UnknownSessionState, this.authCredentials, this.authToken});

  SessionState copyWith({AuthenticatStatuses? authenticatStatus, AuthCredentials? authCredentials,String? authToken}) {
    return SessionState(
        authenticatStatus: authenticatStatus ?? this.authenticatStatus,
        authCredentials: authCredentials ?? this.authCredentials,
        authToken: authToken ?? this.authToken);
  }
}
