import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AlcoolGasolina(),
    ),
  );
}

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  // Variável para exibir o resultado na tela
  String _textoResultado = "RESULTADO";


  void _calcular() {

    double? precoAlcool = double.tryParse(_controllerAlcool.text.replaceAll(",", "."));
    double? precoGasolina = double.tryParse(_controllerGasolina.text.replaceAll(",", "."));

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado = "Número inválido, digite valores maiores que 0 e use ponto (.)";
      });
    } else {
      /* Lógica: Se (preçoAlcool / precoGasolina) >= 0.7, gasolina é melhor.
         Caso contrário, álcool é melhor.
      */
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com álcool";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          // Estica os itens para ocupar a largura toda (como o botão)
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Imagem do Topo
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("lib/img/alcool_ou_gasolina.png"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            // Campo Álcool
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Preço Álcool, ex: 1.59"),
              style: TextStyle(fontSize: 22),
              controller: _controllerAlcool,
            ),
            // Campo Gasolina
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Preço Gasolina, ex: 3.59"),
              style: TextStyle(fontSize: 22),
              controller: _controllerGasolina,
            ),
            // Botão Calcular
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.all(15),
                ),
                child: Text(
                  "Calcular",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: _calcular, // Chama a função de cálculo
              ),
            ),
            // Texto de Resultado
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}