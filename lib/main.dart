import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(
    home: CalculadoraAcademica(),
    debugShowCheckedModeBanner: false,
  ));
}

class Disciplina {
  double tr1 = 0.0;
  double tr2 = 0.0;
  double tr3 = 0.0;
  double p1 = 0.0;
  double tr4 = 0.0;
  double tr5 = 0.0;
  double p2 = 0.0;
  double tr6 = 0.0;
  double tr7 = 0.0;
  double p3 = 0.0;
  double p4 = 0.0;
  double tr8 = 0.0;
  double tr9 = 0.0;
  double sub = 0.0;

  double calcularMedia() {
    return (tr1 +
            tr2 +
            tr3 +
            p1 +
            tr4 +
            tr5 +
            p2 +
            tr6 +
            tr7 +
            p3 +
            p4 +
            tr8 +
            tr9 +
            sub) /
        14;
  }
}

class CalculadoraAcademica extends StatefulWidget {
  const CalculadoraAcademica({Key? key}) : super(key: key);

  @override
  _CalculadoraAcademicaState createState() => _CalculadoraAcademicaState();
}

class _CalculadoraAcademicaState extends State<CalculadoraAcademica> {
  final Disciplina disciplina = Disciplina();
  double media = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Acadêmica'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildCampoNota('TR1', disciplina.tr1),
            _buildCampoNota('TR2', disciplina.tr2),
            _buildCampoNota('TR3', disciplina.tr3),
            _buildCampoNota('P1', disciplina.p1),
            _buildCampoNota('TR4', disciplina.tr4),
            _buildCampoNota('TR5', disciplina.tr5),
            _buildCampoNota('P2', disciplina.p2),
            _buildCampoNota('TR6', disciplina.tr6),
            _buildCampoNota('TR7', disciplina.tr7),
            _buildCampoNota('P3', disciplina.p3),
            _buildCampoNota('P4', disciplina.p4),
            _buildCampoNota('TR8', disciplina.tr8),
            _buildCampoNota('TR9', disciplina.tr9),
            _buildCampoNota('SUB', disciplina.sub),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  media = disciplina.calcularMedia();
                });
              },
              child: const Text('Calcular Média'),
            ),
            Text(
              'Média: ${media.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20.0),
            ),
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Feito por Matheus Silva Gomes, estudante da Fatec de Carapicuíba',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  const Text(
                    'RA: 1431432312017',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      launch('https://github.com/MatheusSilvaGomes07/calculadora_statefull');
                    },
                    child: const Text('Link do Repositório'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampoNota(String label, double nota) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(label),
          ),
          Expanded(
            flex: 3,
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (valor) {
                setState(() {
                  // Atualize a nota diretamente no objeto Disciplina
                  switch (label) {
                    case 'TR1':
                      disciplina.tr1 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'TR2':
                      disciplina.tr2 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'TR3':
                      disciplina.tr3 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'P1':
                      disciplina.p1 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'TR4':
                      disciplina.tr4 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'TR5':
                      disciplina.tr5 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'P2':
                      disciplina.p2 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'TR6':
                      disciplina.tr6 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'TR7':
                      disciplina.tr7 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'P3':
                      disciplina.p3 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'P4':
                      disciplina.p4 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'TR8':
                      disciplina.tr8 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'TR9':
                      disciplina.tr9 = double.tryParse(valor) ?? 0.0;
                      break;
                    case 'SUB':
                      disciplina.sub = double.tryParse(valor) ?? 0.0;
                      break;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
