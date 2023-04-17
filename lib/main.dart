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

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String _infoText = "Informe seus dados";

  void resetFields() {
    pesoController.text = '';
    alturaController.text = '';
    setState(() {
      _infoText = "Informe seus dados";
    });
  }

  void calculate() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);

      _infoText = imc < 18.6 ? "Abaixo do peso(${imc.toStringAsPrecision(4)})" : 'Você não está abaixo do peso';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: resetFields, icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Icon(Icons.person_outlined, size: 120, color: Colors.green),
          entrada_texto("Peso em KG", pesoController),
          entrada_texto("Altura em CM", alturaController),
          ElevatedButton(onPressed: calculate, child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25),), style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green))),
          Text(_infoText,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25)
          )
        ],
      )
      )
    );
  }

  TextField entrada_texto(String label, TextEditingController controller) {
    return  TextField(keyboardType: TextInputType.number, decoration: InputDecoration(labelText: label,
          labelStyle: const TextStyle(color: Colors.green)),  
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.green, fontSize: 25),
          controller: controller,        
          );
  }
}