import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/routes.dart';

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

  @override
  Widget build(BuildContext context) {
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
              new Text(
                "Welcome $name",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
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
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Username",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          obscureText: true,
                          decoration: new InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 8) {
                              return "Password length should be atleast 8";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 40.0),
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
                              // shape: changeButon
                              //   ? BoxShape.circle
                              // : BoxShape.rectangle,
                            ),
                            //new MaterialButton(
                            //height: 40.0,
                            //minWidth: 150.0,
                            //color: Colors.teal,
                            //textColor: Colors.white,
                            //child: new Text("Login"),
                            //splashColor: Colors.purpleAccent,
                            //onPressed: () {
                            //},
                            //)
                          ),
                        ),
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
