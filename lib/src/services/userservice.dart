import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:third_app/src/services/authservice.dart';
import '../models/usermodel.dart';

class UserService{
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection("users");

  Future<void> createNewUser(UserModel user)async{
    try{
      final userCredential = await AuthService().createNewUser(
          email: user.email,
          password: user.password);

      final userId = userCredential?.user?.uid;

      if(userId != null){
        final userRef = _usersCollection.doc(userId);
        final userMap = user.toJson();
        userMap['userId'] = userId;
        await userRef.set(userMap);
        print('User saved successfully with ID: $userId');
      }
    }catch(error){
      print("Error : ${error}");
    }
  }
}