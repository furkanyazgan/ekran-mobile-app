abstract class AppSubmissionStatus {
  const AppSubmissionStatus();
}

class InitialStatus extends AppSubmissionStatus {
  const InitialStatus();
}

class FormSubmitting extends AppSubmissionStatus {}

class FormValidationError extends AppSubmissionStatus {}

class SubmissionLoading extends AppSubmissionStatus {}

class SubmissionSuccess extends AppSubmissionStatus {
  const SubmissionSuccess();
}

class SubmissionFailed extends AppSubmissionStatus {}

class EmailUsedFailed extends AppSubmissionStatus {}
