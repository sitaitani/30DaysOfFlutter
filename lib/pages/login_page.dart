import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/register.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  String name = "";
  bool changeButon = false;
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  get fontSize => null;

  get fontWeight => null;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButon = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButon = false;
      });
    }
  }
final TextEditingController emailController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

//firebase
  final _auth = FirebaseAuth.instanceFor;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage(
              "assets/images/Mountains.jpg",
            ),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          // ignore: unnecessary_new
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: new AssetImage("assets/images/logo.jpg"),
                height: 150,
                fit: BoxFit.cover,

                //    colorBlendMode: BlendMode.darken,
              ),
              const SizedBox(
                height: 20.0,
              ),
              // new Text(
              // "Welcome $name",
              // style: TextStyle(
              // fontSize: 28,
              //  fontWeight: FontWeight.bold,
              //color: Colors.teal),
              // ),
              new Form(
                key: _formkey,
                child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.teal, fontSize: 20.0))),
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    // ignore: unnecessary_new
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          autofocus: false,
                           controller: emailController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Enter Email",
                              //labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          //controller: emailController,
                         keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                          if (value!.isEmpty) {
                          return ("Please Enter Your Email");
                                }
                               // reg expression for email validation
                             if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                             .hasMatch(value)) {
                             return ("Please Enter a valid email");
                              }
                            return null;
                             },
                            onSaved: (value) {
                           emailController.text = value!;
                             },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        new TextFormField(
                          autofocus: false,
                          controller: passwordController,
                          obscureText: true,
                          decoration: new InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Enter Password",
                              // labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                                  validator: (value) {
                                  RegExp regex = new RegExp(r'^.{6,}$');
                                  if (value!.isEmpty) {
                                   return ("Password is required for login");
                                    }
                                   if (!regex.hasMatch(value)) {
                                   return ("Enter Valid Password(Min. 6 Character)");
                                    }
                                       },
                                  onSaved: (value) {
                                    passwordController.text = value!;
                                        },

                          keyboardType: TextInputType.text,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Material(
                          color: Color.fromARGB(255, 103, 72, 109),
                          borderRadius:
                              BorderRadius.circular(changeButon ? 50 : 8),
                          child: InkWell(
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changeButon ? 50 : 150,
                              height: 50,
                              //color: Colors.greenAccent,
                              alignment: Alignment.center,
                              child: changeButon
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.blue,
                                    )
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Myregister()));
                                },
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              )
                            ])
                        //),
                        //),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

