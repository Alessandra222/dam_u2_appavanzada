import "package:flutter/material.dart";

class tres extends StatefulWidget {
  const tres({Key? key}) : super(key: key);

  @override
  State<tres> createState() => _tresState();
}

class _tresState extends State<tres> {
  String _selectedOption = "";
  final List<String> _dias = [
    'Viernes 17 de Marzo 2023',
    'Sabado 18 de Marzo 2023',
    'Domingo 19 de Marzo 2023',
  ];
  String? selectedValue;
  int bAdulto =0;
  int bMayor =0;
  int bMenor =0;
 int T=0;
  void aumentar(int boleto){
    setState((){
      if(boleto==1){
        bAdulto++;
      }else if (boleto ==2){
        bMayor++;
      }else if(boleto==3){
        bMenor++;
      }
    });
  }

  void disminuir(int boleto){
    setState((){
      if(boleto==1 && bAdulto>0){
        bAdulto--;
      }else if (boleto ==2 && bMayor>0){
        bMayor--;
      }else if(boleto==3 && bMenor>0){
        bMenor--;
      }else if(bAdulto<0){ bAdulto=0;}
      else if(bMenor<0){ bMenor=0;}
      else if(bMayor<0){ bMayor=0;}

    });
  }

  void Total(){
    setState((){
        T=(bMayor*250)+(bMenor*300)+(bAdulto*500);
    });
  }

  void mensaje() {
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("¡Gracias por comprar!"),
            content: Text("boletos para el dia: ${selectedValue} \n"
                "boleto Adulto: ${bAdulto} \n"
                "boleto Mayor: ${bMayor} \n"
                "boleto Menor: ${bMenor} \n"
                "Total a pagar: ${T} \n") ,
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
    return ListView(padding: EdgeInsets.all(60), children: [
      Text("VENTA DE BOLETOS", style: TextStyle(fontSize:20)),
      SizedBox(height: 40,),
      DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(
            'Seleccione el día',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: _dias
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
        ),
      ),
      SizedBox(height: 40,),
      Text("Seleccione el número de boletos"),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed:(){ disminuir(1);}, icon:Icon(Icons.exposure_minus_1),),
          Spacer(),
          Column(
            children: [
              Text("${bAdulto}", style: TextStyle( fontSize: 30),),
              SizedBox(height: 10,),
              Text("Adulto" ,style: TextStyle( fontSize: 14),),
              SizedBox(height: 5,),
              Text("500 c/u" ,style: TextStyle( fontSize: 10, color: Colors.indigo),),
            ],
          ),
          Spacer(),
          IconButton(onPressed:(){ aumentar(1);}, icon:Icon(Icons.plus_one),),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed:(){disminuir(2);}, icon:Icon(Icons.exposure_minus_1),),
          Spacer(),
          Column(
            children: [
              Text("${bMayor}", style: TextStyle( fontSize: 30),),
              SizedBox(height: 10,),
              Text("Mayor 60" ,style: TextStyle( fontSize: 14),),
              SizedBox(height: 5,),
              Text("250 c/u" ,style: TextStyle( fontSize: 10, color: Colors.indigo),),
            ],
          ),
          Spacer(),
          IconButton(onPressed:(){aumentar(2);}, icon:Icon(Icons.plus_one),),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed:(){disminuir(3);}, icon:Icon(Icons.exposure_minus_1),),
          Spacer(),
          Column(
            children: [
              Text("${bMenor}", style: TextStyle( fontSize: 30),),
              SizedBox(height: 10,),
              Text("Menor" ,style: TextStyle( fontSize: 14),),
              SizedBox(height: 5,),
              Text("300 c/u" ,style: TextStyle( fontSize: 10, color: Colors.indigo),),
            ],
          ),
          Spacer(),
          IconButton(onPressed:(){aumentar(3);}, icon:Icon(Icons.plus_one),),
        ],
      ),
      SizedBox(height: 20,),
      ElevatedButton(onPressed: (){
        Total();
        mensaje();
      }, child: Text("Comprar"), style: ElevatedButton.styleFrom(backgroundColor:  Color(0xFF8E1F4C)) ),

    ]);
  }
}
