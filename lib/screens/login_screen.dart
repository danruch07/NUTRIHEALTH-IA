import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrihealth/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/images/logo.jpeg'),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(12),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Usuario",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: TextField(
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Contraseña",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: passToggle
                          ? Icon(CupertinoIcons.eye_slash_fill)
                          : Icon(CupertinoIcons.eye_fill),
                    ),
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
                        // Acción del botón de iniciar sesión
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Center(
                          child: Text(
                            "Iniciar Sesion",
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿Aún no tienes cuenta?",
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
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "CREAR",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ))
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "La información presentada en  no debe "
                      "interpretarse como asesoramiento profesional o recomendaciones médicas.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Regresar",style: TextStyle(color: Colors.green),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
