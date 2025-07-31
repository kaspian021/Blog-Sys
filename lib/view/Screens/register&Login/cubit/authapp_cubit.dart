import 'package:bloc/bloc.dart';
import 'package:blog_system_app/component/elements.dart';
import 'package:blog_system_app/model/model_result.dart';
import 'package:blog_system_app/service/Urls.dart';
import 'package:blog_system_app/service/service_tools.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'authapp_state.dart';

class AuthappCubit extends Cubit<AuthappState> {
  AuthappCubit() : super(AuthappInitial()){

    if(WidgetsAndVariableStatic.box.read(SaveToken.token)!=null){
      emit(LoadedState());
    }else{
      emit(LogoutState());
    }

  }
  Dio dio= Dio();
  void sendSmsEmail(String email,String password)async{
    emit(LoadingState());
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );

      final User? user = userCredential.user;

      if (user != null) {
        
        WidgetsAndVariableStatic.box.write(SaveToken.token, user.uid);
        
        emit(LoadedState());
        
      }
    } on FirebaseAuthException catch (e) {
      emit(ErrorState());
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
