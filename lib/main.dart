import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de Média',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculadoraMedia(),
    );
  }
}

class CalculadoraMedia extends StatefulWidget {
  const CalculadoraMedia({super.key});

  @override
  State<CalculadoraMedia> createState() => _CalculadoraMediaState();
}

class _CalculadoraMediaState extends State<CalculadoraMedia> {
  // Controllers para os campos de texto
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerNota1 = TextEditingController();
  final TextEditingController _controllerNota2 = TextEditingController();
  final TextEditingController _controllerNota3 = TextEditingController();

  // Variáveis de estado para exibir o resultado
  String _resultadoNome = "";
  String _resultadoEmail = "";
  String _resultadoNotas = "-  -  -";
  String _resultadoMedia = "";

  void _calcularMedia() {
    setState(() {
      _resultadoNome = _controllerNome.text;
      _resultadoEmail = _controllerEmail.text;
      
      double n1 = double.tryParse(_controllerNota1.text) ?? 0.0;
      double n2 = double.tryParse(_controllerNota2.text) ?? 0.0;
      double n3 = double.tryParse(_controllerNota3.text) ?? 0.0;
      
      double media = (n1 + n2 + n3) / 3;
      
      _resultadoNotas = "${n1.toStringAsFixed(1)} - ${n2.toStringAsFixed(1)} - ${n3.toStringAsFixed(1)}";
      _resultadoMedia = media.toStringAsFixed(1);
    });
  }

  void _limparCampos() {
    setState(() {
      _controllerNome.clear();
      _controllerEmail.clear();
      _controllerNota1.clear();
      _controllerNota2.clear();
      _controllerNota3.clear();
      
      _resultadoNome = "";
      _resultadoEmail = "";
      _resultadoNotas = "-  -  -";
      _resultadoMedia = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculadora Gabriel H. e Pedro C.",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.calculate_rounded,
              size: 80,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 10),
            const Text(
              "CALCULADORA DE MÉDIA",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _controllerNome,
              decoration: const InputDecoration(
                labelText: "Nome",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                filled: true,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _controllerEmail,
              decoration: const InputDecoration(
                labelText: "E-mail",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controllerNota1,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      labelText: "Nota 1",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _controllerNota2,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      labelText: "Nota 2",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _controllerNota3,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      labelText: "Nota 3",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: _calcularMedia,
              icon: const Icon(Icons.analytics),
              label: const Text("CALCULAR MÉDIA"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
            ),
            const SizedBox(height: 20),
            if (_resultadoMedia.isNotEmpty)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "Resultado",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.person_outline),
                        title: const Text("Nome"),
                        subtitle: Text(_resultadoNome),
                        dense: true,
                      ),
                      ListTile(
                        leading: const Icon(Icons.alternate_email),
                        title: const Text("E-mail"),
                        subtitle: Text(_resultadoEmail),
                        dense: true,
                      ),
                      ListTile(
                        leading: const Icon(Icons.format_list_numbered),
                        title: const Text("Notas"),
                        subtitle: Text(_resultadoNotas),
                        dense: true,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Média Final: ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _resultadoMedia,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 15),
            OutlinedButton.icon(
              onPressed: _limparCampos,
              icon: const Icon(Icons.delete_outline),
              label: const Text("LIMPAR CAMPOS"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                side: const BorderSide(color: Colors.deepPurple),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
