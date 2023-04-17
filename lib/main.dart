import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: Home(),  )
    );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Icon(Icons.person_outlined, size: 120, color: Colors.green),
          entrada_texto("Peso em KG"),
          entrada_texto("Altura em CM"),
          ElevatedButton(onPressed: () {}, child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25),), style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green))),
          Text("Info",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25)
          )
        ],
      )
    );
  }

  TextField entrada_texto(String label) {
    return  TextField(keyboardType: TextInputType.number, decoration: InputDecoration(labelText: label,
          labelStyle: const TextStyle(color: Colors.green)),  
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.green, fontSize: 25)        
          );
  }
}