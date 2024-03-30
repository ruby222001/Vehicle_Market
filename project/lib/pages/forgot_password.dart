import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgotpasswordpage extends StatefulWidget {
  const Forgotpasswordpage({super.key});

  @override
  State<Forgotpasswordpage> createState() => _ForgotpasswordpageState();
}

class _ForgotpasswordpageState extends State<Forgotpasswordpage> {
  final _emailController = TextEditingController();
  @override

  void dispose(){
    _emailController.dispose();
    super.dispose();
  }
  Future passwordReset() async{
   try{
     await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
 // ignore: use_build_context_synchronously
 showDialog(
  context: context, builder: (context){
      return const AlertDialog(
        content: Text('Password reset link sent'),
      );
    });
  }
  on FirebaseAuthException catch (e) {
    // ignore: use_build_context_synchronously
    showDialog(
      context: context, 
      builder: (context){
      return AlertDialog(
        content: Text(e.message.toString()),
      );
    });
  }
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
elevation: 0,      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal:25.0),
            child: Text('enter your email'),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _emailController,
          
          decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color:Colors.white),
          ),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color:Colors.purple),
          ),
          hintText: 'Email',
          fillColor: Colors.grey[200],
          filled: true,
          ),
          ),
                    const SizedBox(height: 10),
MaterialButton(onPressed: passwordReset,
color: Colors.deepPurple[200],
child: const Text('Reset Password'),
),
        ],
      ),
    );
  }
}