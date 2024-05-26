import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = true;
  bool passwordVisible1 = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Image(
                  image: AssetImage("assets/images/tiled/image_bg_2.jpeg"),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image(image: AssetImage("assets/bonfire.gif")),
                  ),
                ),
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
                                "Register User",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              TextFormField(
                                obscureText: passwordVisible,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(fontSize: 12),
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
                              TextFormField(
                                obscureText: passwordVisible1,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(fontSize: 12),
                                  suffixIcon: IconButton(
                                    icon: Icon(passwordVisible1
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(
                                        () {
                                          passwordVisible1 = !passwordVisible1;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8),
                                    side: const BorderSide(color: Colors.black),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Login here!",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 38, 67, 90),
                                      fontSize: 12,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        backgroundColor: Colors.white54))
              ],
            ),
          )
        ],
      ),
    );
  }
}
