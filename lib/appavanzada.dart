import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dam_u2_appavanzada/dos.dart';
import 'package:dam_u2_appavanzada/tres.dart';
import 'package:dam_u2_appavanzada/uno.dart';
import 'package:flutter/material.dart';

class appAvanzada extends StatefulWidget {
  const appAvanzada({Key? key}) : super(key: key);

  @override
  State<appAvanzada> createState() => _appAvanzadaState();
}

class _appAvanzadaState extends State<appAvanzada> {
  int _indice =0;
  bool dark = false;

  void _cambiarPantalla(int i){
    setState((){
      _indice=i;
    });
  }

  final List<Widget> _pantallitas =[
    uno(),
    dos(),
    tres()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lieblings TV-Show"),
        centerTitle: true,
          backgroundColor: Color(0xFF5E2129),
        actions:[
          IconButton(onPressed:(){
            setState((){
              dark=!dark;
              if(dark){ AdaptiveTheme.of(context).setDark();}
              else {AdaptiveTheme.of(context).setLight();}
            });
          }, icon: Icon(dark ? Icons.light_mode : Icons.dark_mode))
        ]
      ),
      body: _pantallitas[_indice],
      bottomNavigationBar: BottomNavigationBar(items:[
        BottomNavigationBarItem(icon: Icon(Icons.book_online), label: "Series"),
        BottomNavigationBarItem(icon: Icon(Icons.question_answer_outlined), label: "Quiz"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "boletos")
      ],
        currentIndex: _indice,
        iconSize: 30,
        backgroundColor: Color(0xFF5E2129),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: _cambiarPantalla,

      )
    );
  }
}
