import 'package:flutter/material.dart';

class dos extends StatefulWidget {
  const dos({Key? key}) : super(key: key);

  @override
  State<dos> createState() => _dosState();
}

class _dosState extends State<dos> {

  final Q1 = TextEditingController();
  final Q2 = TextEditingController();
  final Q3 = TextEditingController();
  String respuesta="";

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(60),
      children: [
        TextField(controller: Q1,
          decoration: InputDecoration(
              labelText: "¿Qué tipo de actividades te interesan más de las convenciones",
              border: UnderlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
        ),
        SizedBox(height: 20,),
        TextField(controller: Q2,
          decoration: InputDecoration(
              labelText: "¿Qué actor ansias más ver",
              border: UnderlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
        ),
        SizedBox(height: 20,),
        TextField(controller: Q3,
          decoration: InputDecoration(
              labelText: "¿Cuál es tu motivo principal de venir?",
              border: UnderlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
        ),
        SizedBox(height: 40,),
        ElevatedButton(onPressed: (){
          setState((){
            respuesta = "Usted ha respondido lo siguiente: \n \n"
                "${Q1.text} \n"
                "${Q2.text} \n"
                "${Q3.text}";
          });
        }, child: Text("Enviar"), style: ElevatedButton.styleFrom(backgroundColor:  Color(0xFF8E1F4C)) ),
        SizedBox(height: 70,),
        Text("${respuesta}"),
      ],
    );
  }
}
