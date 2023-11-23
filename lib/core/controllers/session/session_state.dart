import 'package:ekran/core/models/auth/auth_credentials.dart';

enum AuthenticatStatuses { UnknownSessionState, Unauthenticated, Authenticated }

class SessionState {
  AuthenticatStatuses authenticatStatus;
  AuthCredentials? authCredentials;

  SessionState({
    this.authenticatStatus = AuthenticatStatuses.UnknownSessionState,
    this.authCredentials,
  });

  SessionState copyWith({AuthenticatStatuses? authenticatStatus, AuthCredentials? authCredentials}) {
    return SessionState(
        authenticatStatus: authenticatStatus ?? this.authenticatStatus,
        authCredentials: authCredentials ?? this.authCredentials);
  }
}
