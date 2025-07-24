import 'package:bloc/bloc.dart';
import 'package:blog_system_app/component/Urls.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'authapp_state.dart';

class AuthappCubit extends Cubit<AuthappState> {
  AuthappCubit() : super(AuthappInitial());
  Dio dio= Dio();
  void sendSms(String mobileNumber)async{
    emit(LoadingState());

    try {
      var response= await dio.post(Urls.baseUrl,
        data: {'mobileNumber':mobileNumber}
      );
      if(response.statusCode==201){
        emit(SendSmsState());
      }else{
        emit(ErrorState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }
  void verifyCode(String mobileNumber,int codeSms)async{
    emit(LoadingState());

    try {
      var response= await dio.post(Urls.baseUrl,
        data: {'mobileNumber':mobileNumber,'codeSms':codeSms}
      );
      if(response.statusCode==201){
        emit(VerifyCodeState());
      }else{
        emit(ErrorState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }
}
