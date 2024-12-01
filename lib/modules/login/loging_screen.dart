import 'package:flutter/material.dart';
import 'package:shop_app/modules/register/register_screen.dart';

class LogingScreen extends StatelessWidget {
  const LogingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Login Here',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0,),
                Text('Welcome back you’ve been missed!',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 50.0,),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'please enter your email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(
                      Icons.email_outlined
                    ),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(15.0)),
                   ),
                  ),
                ),
                SizedBox(height: 30.0,),
                TextFormField(
                  controller: passController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                        Icons.password_outlined,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_outlined,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                      onPressed: (){},
                    child: Text(
                      'Login'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 5.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Don\'t Have an Account?',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> RegisterScreen()),
                          );
                        },
                        child: Text(
                            'Register Now',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
