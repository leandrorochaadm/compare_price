import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final resultProd1 = 'O preço do produto 1 é mais vantajoso';
  final resultProd2 = 'O preço do produto 2 é mais vantajoso';

  final formKey = GlobalKey<FormState>();
  final tePrice1 = TextEditingController();
  final teQuant1 = TextEditingController();
  final tePrice2 = TextEditingController();
  final teQuant2 = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Compare Preços',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Produto 1',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: teQuant1,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Quantidade',
                      hintText: 'Digite a quantidade no produto 1',
                    ),
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.numbersBetweenInterval(
                        1,
                        1000000,
                        'Quantidade deve ser maior que zero',
                      ),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: tePrice1,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Preço',
                      hintText: 'Digite o preço no produto 1',
                    ),
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.numbersBetweenInterval(
                        1,
                        1000000,
                        'Preço deve ser maior que zero',
                      ),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Produto 2',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: teQuant2,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Quantidade',
                      hintText: 'Digite a quantidade no produto 2',
                    ),
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.numbersBetweenInterval(
                        1,
                        1000000,
                        'Quantidade deve ser maior que zero',
                      ),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: tePrice2,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Preço',
                      hintText: 'Digite o preço no produto 2',
                    ),
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.numbersBetweenInterval(
                        1,
                        1000000,
                        'Preço deve ser maior que zero',
                      ),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () {
                      result = '';
                      final isValid = formKey.currentState?.validate() ?? false;
                      if (isValid) {
                        final prod1 = double.parse(tePrice1.value.text) /
                            double.parse(teQuant1.value.text);
                        final prod2 = double.parse(tePrice2.value.text) /
                            double.parse(teQuant2.value.text);
                        final resultIsProd1 = prod1 < prod2;
                        if (resultIsProd1) {
                          result = resultProd1;
                        } else {
                          result = resultProd2;
                        }
                        setState(() {});
                      }
                    },
                    child: const Text(
                      'COMPARAR',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Visibility(
                    visible: result.isNotEmpty || result != '',
                    child: Text(
                      result,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
