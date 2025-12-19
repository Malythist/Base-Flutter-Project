import 'failure.dart';

extension FailureMessage on Failure {
  String get message => when(
    network: (message) => message,
    unauthorized: (message) => message,
    server: (message, code) =>
    code == null ? message : '$message (код $code)',
    unknown: (message) => message,
  );
}
