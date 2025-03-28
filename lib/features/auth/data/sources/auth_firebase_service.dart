import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/core/configs/constants/app_urls.dart';
import 'package:spotify_clone/features/auth/data/models/create_user_req.dart';
import 'package:spotify_clone/features/auth/data/models/signin_user_req.dart';
import 'package:spotify_clone/features/auth/data/models/user.dart';
import 'package:spotify_clone/features/auth/domain/entities/user.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<Either> signIn(SigninUserReq signinUserReq);
   Future<Either> getUser( );
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);

      return const Right('Signin was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user';
      } else {
        message = "Oops..Someting went wrong.Try agin later.";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
    var data=  await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
  FirebaseFirestore.instance.collection(
      'Users'
      ).doc(data.user?.uid) .set({
        'email': data.user!.email,
        'name': createUserReq.fullName
      });

      return Right('Sign up successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      else {
        message = "Oops..Someting went wrong.Try agin later.";
      }

      return Left(message);
    }
  }
  
   @override
  Future < Either > getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore.collection('Users').doc(
        firebaseAuth.currentUser?.uid
      ).get();

      UserModel userModel = UserModel.fromJson(user.data() !);
      userModel.imageURL = firebaseAuth.currentUser?.photoURL ?? AppURLs.defaultImage;
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return const Left('An error occurred');
    }
  }

}
