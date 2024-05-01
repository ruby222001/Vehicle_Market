import 'package:flutter/material.dart';

class Forgotpasswordpage extends StatefulWidget {
  const Forgotpasswordpage({Key? key}) : super(key: key);

  @override
  State<Forgotpasswordpage> createState() => _ForgotpasswordpageState();
}

class _ForgotpasswordpageState extends State<Forgotpasswordpage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
   
    if (_emailController.text.trim().isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Password reset link sent'),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Please enter an email address'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('enter your email'),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.purple),
              ),
              hintText: 'Email',
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: passwordReset,
            color: Colors.deepPurple[200],
            child: const Text('Reset Password'),
          ),
        ],
      ),
    );
  }
}
