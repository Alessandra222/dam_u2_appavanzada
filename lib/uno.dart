import 'package:flutter/material.dart';

class uno extends StatefulWidget {
  const uno({Key? key}) : super(key: key);

  @override
  State<uno> createState() => _unoState();
}

class _unoState extends State<uno> {
  List<bool> _values = List.generate(6, (_) => false);
  int _calificacion = 0;
  List fotitos =["2125","ANNE","Dark","ST","Supernatural"];
  int _indice = 0;

  void next(){
    setState((){
      _indice++;
      if(_indice==fotitos.length){
        _indice=0;
      }
    });
  }

  void before(){
    setState((){
      _indice--;
      if(_indice<0){
        _indice=fotitos.length-1;
      }
    });
  }

  void limpiar(){
    setState((){
      _values[1]=false;
      _values[5]=false;
      _values[2]=false;
      _values[3]=false;
      _values[4]=false;
      _calificacion =0;
    });
  }

  void mensaje() {
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("¡Gracias por puntuar!"),
            content: Text("Serie: ${fotitos[_indice]} \n"
                "Calificacion: ${_calificacion}") ,
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  child: Text("Ok"))
            ],
          ); //AlertDialog
        }); //showDialog
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(60),
      children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed:(){limpiar(); before();}, icon:Icon(Icons.navigate_before),),
            Spacer(),
            SizedBox(width:150, height: 300, child: Image.asset("assets/${fotitos[_indice]}.jpg")),
            Spacer(),
            IconButton(onPressed:(){limpiar(); next();}, icon:Icon(Icons.navigate_next),),
          ]
        ),
         Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(width:10),
              IconButton(
                onPressed: () {
                  setState(() {
                    _values[1]=!_values[1];
                    if(_values[1]==false){
                      _calificacion =0;
                      _values[5]=false;
                      _values[2]=false;
                      _values[3]=false;
                      _values[4]=false;
                    }else{
                      _calificacion =20;
                    }

                  });
                },
                icon: Icon(_values[1] ? Icons.favorite:Icons.favorite_border),),

              IconButton(
                onPressed: () {
                  setState(() {
                    _values[2]=!_values[2];
                    if(_values[2]==false){
                      _calificacion =20;
                      _values[5]=false;
                      _values[3]=false;
                      _values[4]=false;
                    }else{
                      _calificacion =40;
                      _values[1]=true;
                    }

                  });
                },
                icon: Icon(_values[2] ? Icons.favorite:Icons.favorite_border),),
              IconButton(
                onPressed: () {
                  setState(() {
                    _values[3]=!_values[3];
                    if(_values[3]==false){
                      _calificacion =40;
                      _values[5]=false;
                      _values[4]=false;
                    }else{
                      _calificacion =60;
                      _values[1]=true;
                      _values[2]=true;
                    }

                  });
                },
                icon: Icon(_values[3] ? Icons.favorite:Icons.favorite_border),),
              IconButton(
                onPressed: () {
                  setState(() {
                    _values[4]=!_values[4];
                    if(_values[4]==false){
                      _calificacion =60;
                      _values[5]=false;
                    }else{
                      _calificacion =80;
                      _values[1]=true;
                      _values[2]=true;
                      _values[3]=true;
                    }

                  });
                },
                icon: Icon(_values[4] ? Icons.favorite:Icons.favorite_border),),
              IconButton(
                onPressed: () {
                  setState(() {
                    _values[5]=!_values[5];
                    if(_values[5]==false){
                      _calificacion =80;
                    }else{
                      _calificacion =100;
                      _values[1]=true;
                      _values[2]=true;
                      _values[3]=true;
                      _values[4]=true;
                    }
                  });
                },
                icon: Icon(_values[5] ? Icons.favorite:Icons.favorite_border),),
            ]

        ),
        SizedBox(height: 10,),
        Text('Calificación: $_calificacion', textAlign: TextAlign.center,),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){
          mensaje();
        }, child: Text("Puntuar <3"), style: ElevatedButton.styleFrom(backgroundColor:  Color(0xFF8E1F4C)) ),

      ]
    );
  }
}
