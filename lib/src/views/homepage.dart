import 'package:flutter/material.dart';
import 'package:third_app/src/services/authservice.dart';
import 'package:third_app/src/views/welcomepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    Future<void> _signOut()async{
      await AuthService().signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const WelcomePage();
      },));
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child:  Text("Logout")),
          IconButton(onPressed: _signOut, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
