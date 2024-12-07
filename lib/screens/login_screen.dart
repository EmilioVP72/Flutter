
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    final txtUser = TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: 'Email User',
        fillColor: Color.fromARGB(255, 75, 99, 140),
        filled: true,
        border: OutlineInputBorder()
      ),
    );
    
    final txtPwd  = TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: 'Password User',
        fillColor: Color.fromARGB(255, 75, 99, 140),
        filled: true,
        border: OutlineInputBorder()
      ),
    );

    final conCredentials = Positioned(
      bottom: 190,
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.black,
          borderRadius: BorderRadius.circular(20)
        ),
        height: 200,
        width: 350,
        child: ListView(
          children: [
            txtUser,
            const SizedBox(height: 10,),
            txtPwd
          ],
        ),
      ),
    );

    final imgLogo = Positioned(
      top: 110, height: 150,
      child: Image.asset('clase/logo_halo.png'),
    );

  final imgBtn = Positioned(
  bottom: 100,
  left: 0,
  right: 0, // Ocupa todo el ancho de la pantalla
  child: Align(
    alignment: Alignment.center, // Centra el contenido dentro de Positione
      child: GestureDetector(
        onTap: () {
          isLoading = true;
          setState(() {});
          Future.delayed(const Duration(seconds: 3)).then(
            (value) {
              isLoading = false;
              setState(() {});
              Navigator.pushNamed(context, '/dash');
            },
          );
        },
        child: Image.asset('clase/btn_halo.png',
          height: 90,
        ),
      ),
  ),
);

    const progress = Positioned(
      top: 500,
      child: CircularProgressIndicator()
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            //opacity: .5,
            fit: BoxFit.cover,
            image: AssetImage('clase/back_halo.png')
          )
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            imgLogo,
            isLoading ? progress : Container(),
            imgBtn,
            conCredentials
          ],
        ),
      ),
    );
  }
}
