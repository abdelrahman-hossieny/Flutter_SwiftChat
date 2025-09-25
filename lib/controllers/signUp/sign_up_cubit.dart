import 'package:bloc/bloc.dart';
import 'package:chatapp/firebase/firebase_Auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {

  FirebaseAuthService firebaseAuthService = FirebaseAuthService();

  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp(String email, String password) async {
    emit(SignUpLoading());
    try {
      // Simulate a network call or any async operation
      await firebaseAuthService.signUpWithEmailAndPassword(email, password);
      // If successful, emit success state
      emit(SignUpSuccess());
    } catch (e) {
      // If there's an error, emit failure state with error message
      emit(SignUpFailure(e.toString()));
    }
  }
}

