import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrihealth/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset('assets/images/equipo.png'),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: TextField(
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          labelText: "Nombre",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green
                            )
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: TextField(
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          labelText: "Correo",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green
                            )
                          )

                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: TextField(
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Celular",
                          border: OutlineInputBorder(
                          ),
                          prefixIcon: Icon(Icons.phone_android),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green
                            )
                          )

                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: TextField(
                        cursorColor: Colors.green,
                        obscureText: passToggle ? true : false,
                        decoration: InputDecoration(
                          labelText: "Contraseña",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child: Icon(
                              passToggle
                                  ? CupertinoIcons.eye_slash_fill
                                  : CupertinoIcons.eye_fill,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green
                            )
                          )
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Material(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute
                              // (builder: (context)=> LoginScreen()
                              //));
                            },
                            child: Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                              child: Center(
                                child: Text(
                                  "Crear Cuenta",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "¿Ya tienes cuenta?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Iniciar Sesion",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
