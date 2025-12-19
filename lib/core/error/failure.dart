import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network({required String message}) = NetworkFailure;
  const factory Failure.unauthorized({required String message}) = UnauthorizedFailure;
  const factory Failure.server({required String message, int? code}) = ServerFailure;
  const factory Failure.unknown({required String message}) = UnknownFailure;
}