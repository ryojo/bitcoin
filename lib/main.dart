import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";

void main (){

  runApp(
MaterialApp(
debugShowCheckedModeBanner: false,
home: Home(),


),
  );
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 String _numero =  "0";
 void _Resultado() async{
String url = "https://blockchain.info/ticker";
http.Response response;
response = await http.get(url);

Map<String,dynamic> responsive = json.decode(response.body);
var real = responsive["BRL"] ["last"];
setState(() {
  print(response.statusCode.toString());
  _numero = real.toString(); 
});


}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Container(
padding: EdgeInsets.all(32),
width: double.infinity,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,



  children: <Widget>[
    Image.asset("imagens/bitcoin.png"),
    Padding(padding: EdgeInsets.only(top:40, bottom:40),
    child:  Text("R\$"+_numero,
    style: TextStyle(
      fontSize:32
    ),
    ),
     ),
     
     RaisedButton(onPressed:_Resultado ,
     child: Text("Atualizar", 
     style: TextStyle(
       fontSize: 19,

       color: Colors.white,
      ),
     ),
      padding: EdgeInsets.fromLTRB(30, 15, 30,15),
     color: Colors.orange,
     ),
     
  ],
),

  ),
);
  }
}