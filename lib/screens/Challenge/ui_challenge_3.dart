library ui_challenge_3;
import 'package:flutter/material.dart';
import 'hero_model.dart';
import 'hero_widget.dart';

class UiChallenge3 extends StatefulWidget {
  const UiChallenge3({super.key});

  @override
  _UiChallenge3State createState() => _UiChallenge3State();
}

class _UiChallenge3State extends State<UiChallenge3> {
  late ScrollController _scrollController;

  double toolbarOpacity = 1.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset <= 80) {
          toolbarOpacity = (80 - _scrollController.offset) / 80;
        } else {
          toolbarOpacity = 0;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(112, 198, 198, 0.824),
              Color.fromARGB(255, 94, 197, 228), //colores para el fondo 
              Color.fromRGBO(112, 198, 198, 0.824)

            ],
            begin: Alignment(0.3, -1),
            end: Alignment(-0.8, 1),
          ),
        ),
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 80, bottom: 40),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: HeroRowWidget(hero: heroes[index]),
                );
              },
              itemCount: heroes.length,
            ),
            Opacity(
              opacity: toolbarOpacity,
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      'Halo.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 80,
                    )),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
