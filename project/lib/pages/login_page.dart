import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/auth/google_sign_in.dart';
import 'package:project/components/my_button.dart';
import 'package:project/components/my_textfield.dart';
import 'package:project/components/square_title.dart';
import 'package:project/models/helper_functions.dart';
import 'package:project/pages/forgot_password.dart';
class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const  LoginPage({super.key,  this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  TextEditingController emailController = TextEditingController();

    TextEditingController passwordController = TextEditingController();

  //login method
  void loginUser() async{
    //show loading circle
    showDialog(context: context, 
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
    );

    
    //try creating user
try{
  //creating user
 await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text, 
    password: passwordController.text,
    );
    //pop loading circle
   if (context.mounted) Navigator.pop(context);
}
on FirebaseAuthException catch(e){
  //pop loading circle
  Navigator.pop(context);
  displayMessageToUser(e.code, context);
 

}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
        Icon(Icons.person,
        size: 80,
        color: Theme.of(context).colorScheme.inversePrimary,
        ),
        const SizedBox(height: 25),
              //title
        const Text('Vehicle',
        style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 25),
        
        //email textfield
        MyTextField(
          hintText: 'Email', 
          obscureText: false, 
          controller: emailController,
          ),
        const SizedBox(height: 10),
        
          //pasword
          MyTextField(
          hintText: 'Password', 
          obscureText: true, 
          controller: passwordController,
          ),
         const SizedBox(height: 10,),

          //forgot password
         Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Forgotpasswordpage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ),
                  const SizedBox(height: 25,),
MyButton(
  onTap: loginUser,
 child: const Text("Login"),
 ),
 const SizedBox(height: 20),
 //don't have an account? Register here
 Row(
      mainAxisAlignment: MainAxisAlignment.center,

   children: [
    const Text("don't have an account? "
     ),
     GestureDetector(
      onTap: widget.onTap,
       child: const Text("Register Here",
      style: TextStyle(
       fontWeight: FontWeight.bold
      ),),
     ),
   ],
 ),
 Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
SquareTile(onTap: () => AuthService().signInWithGoogle(),
 imagePath: 'lib/images/google.png',)
    
  ]
 )
           ],
          ),
        ),
      ),
    );
  }
}