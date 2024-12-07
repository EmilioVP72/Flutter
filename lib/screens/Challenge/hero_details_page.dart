import 'package:flutter/material.dart';
import 'package:tap_2/screens/Challenge/hero_model.dart';

class HeroDetailsPage extends StatefulWidget {
  final HeroModel hero;

  const HeroDetailsPage(this.hero, {super.key});

  @override
  _HeroDetailsPageState createState() => _HeroDetailsPageState();
}

class _HeroDetailsPageState extends State<HeroDetailsPage> {
  final appBarHeight = 80.0;

  late ScrollController _scrollController;

  double toolbarOpacity = 1.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset <= appBarHeight) {
          toolbarOpacity = (appBarHeight - _scrollController.offset) / appBarHeight;
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
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(112, 198, 198, 0.824),
              Color.fromARGB(255, 94, 197, 228),
              Color.fromRGBO(112, 198, 198, 0.824)
            ],
            begin: Alignment(0.3, -1),
            end: Alignment(-0.8, 1),
          ),
        ),
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              padding: EdgeInsets.only(top: appBarHeight),
              children: [
                _HeroDetailsImage(widget.hero),
                _HeroDetailsName(widget.hero.name),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
                  child: Text(
                    widget.hero.description,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 28,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 54,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 92, 161, 169),  // Color de fondo del botón
                          side: const BorderSide(
                            color: Color.fromARGB(48, 31, 0, 0),  // Color del borde
                            width: 1,  // Ancho del borde
                          ),
                          overlayColor: const Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                          child: new Text(
                            'Añadir Favorito',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 227, 227, 227),
                              fontSize: 12,
                            ),
                          ),
                      ),
                      )
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0.0), // Establece el relleno
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0), 
                            ),
                          ),
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(112, 198, 198, 0.824),
                                Color.fromARGB(255, 78, 115, 126),
                              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                              // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: const Text(
                                'OK',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 28,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
              ],
            ),
            SafeArea(
              child: Opacity(
                opacity: toolbarOpacity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Text(
                      'Review',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: appBarHeight,
                    )),
                    SizedBox(
                      width: appBarHeight,
                      height: appBarHeight,
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroDetailsImage extends StatelessWidget {
  final HeroModel hero;

  const _HeroDetailsImage(this.hero);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, left: 28.0, right: 28.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(28)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(28)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(28)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Hero(
                        tag: hero.name,
                        child: Image.asset(hero.image),
                      ),
                    ),
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

class _HeroDetailsName extends StatelessWidget {
  final String heroName;

  const _HeroDetailsName(this.heroName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
      height: 86,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              heroName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 42,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Text(
                heroName,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.1),
                  fontWeight: FontWeight.bold,
                  fontSize: 56,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}