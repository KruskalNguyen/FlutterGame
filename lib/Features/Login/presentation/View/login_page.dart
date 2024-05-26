import 'package:drainblood/Features/Home/presentation/views/home_page_route.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:drainblood/Features/Register/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _email = '';

  String _photoUrl = '';
  bool passwordVisible = true;

  void _signIngGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);

        User? user = FirebaseAuth.instance.currentUser;

        setState(() {
          _email = user!.email!;
          HomePageRoute.displayName = user.displayName!;
          // _phoneNumber = user.phoneNumber!;
          _photoUrl = user.photoURL!;
        });

        Navigator.pushNamed(context, HomePageRoute.routeName);
      }
    } catch (e) {
      setState(() {
        _email = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Center(
            child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Image(
              image: AssetImage("assets/images/tiled/image_bg_2.jpeg"),
              fit: BoxFit.cover),
        )),
        Center(
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Can thay đổi để căn chỉnh các cột
            children: [
              // column 1: bonfire gif
              const Expanded(
                flex: 2,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image(image: AssetImage("assets/bonfire.gif")),
                ),
              ),
              // column 2: login form
              Expanded(
                flex: 1,
                child: Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Username or Email',
                                labelStyle: TextStyle(fontSize: 12),
                                icon: Icon(Icons.account_circle)),
                          ),
                          TextFormField(
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(fontSize: 12),
                              icon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(
                                    () {
                                      passwordVisible = !passwordVisible;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8),
                                          side: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RegisterPage()));
                                        },
                                        child: const Text(
                                          "Register",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        )),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    flex: 1,
                                    child: FilledButton(
                                        style: FilledButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 8),
                                            backgroundColor: Colors.blue),
                                        onPressed: () => _signIngGoogle,
                                        child: const Text(
                                          "Sign in",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        )),
                                  ),
                                ],
                              ),
                              Row(children: <Widget>[
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 20.0),
                                      child: const Divider(
                                        color: Colors.black,
                                        height: 36,
                                      )),
                                ),
                                const Text("or"),
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20.0, right: 10.0),
                                      child: const Divider(
                                        color: Colors.black,
                                        height: 36,
                                      )),
                                ),
                              ]),
                              SignInButton(
                                onPressed: () {
                                  _signIngGoogle();
                                },
                                Buttons.Google,
                                mini: false,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white54),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
