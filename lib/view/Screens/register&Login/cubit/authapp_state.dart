part of 'authapp_cubit.dart';

@immutable
sealed class AuthappState {}

final class AuthappInitial extends AuthappState {}
final class ErrorState extends AuthappState {}
final class LoadingState extends AuthappState {}
final class SendSmsState extends AuthappState {}
final class VerifyCodeState extends AuthappState {}
final class RegisterState extends AuthappState {}
final class LogoutState extends AuthappState {}
