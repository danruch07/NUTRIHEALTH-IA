import 'package:flutter/material.dart';
import 'package:nutrihealth/screens/login_screen.dart';
import 'package:nutrihealth/widgets/navbar_roots.dart';
import 'package:nutrihealth/screens/signup_screen.dart';

class WelcomeScreen extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 15),
            Align(alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute
                  (builder: (context)=> NavBarRoots()));
              },
              child: Text("Saltar",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
              ),
              ),
            ),
            ),
            SizedBox(height: 50),
            Padding(padding: EdgeInsets.all(20),
              child: Image.asset('assets/images/logo.jpeg'),
            ),
            SizedBox(height: 50),
            Text("NUTRIHEALT",
            style: TextStyle(
              color: Colors.green,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 10,
            ),
            ),
            SizedBox(height: 10),
            Text("Protegete cuidate",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              wordSpacing: 5
            ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute
                      (builder: (context)=> LoginScreen()
                      ));
                    },
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text("Iniciar Sesion",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
                Material(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute
                        (builder: (context)=> SignUpScreen()
                      ));
                    },
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text("Crear Cuenta",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}