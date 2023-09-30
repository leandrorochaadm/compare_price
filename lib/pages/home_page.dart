import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final TEPrice1 = TextEditingController();
  final TEQuant1 = TextEditingController();
  final TEPrice2 = TextEditingController();
  final TEQuant2 = TextEditingController();

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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Quantidade',
                      hintText: 'Digite a quantidade no produto 1',
                    ),
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.numbersBetweenInterval(
                          1, 1000000, 'Quantidade deve ser maior que zero'),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Preço',
                      hintText: 'Digite o preço no produto 1',
                    ),
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.numbersBetweenInterval(
                          1, 1000000, 'Preço deve ser maior que zero'),
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Quantidade',
                      hintText: 'Digite a quantidade no produto 2',
                    ),
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.numbersBetweenInterval(
                          1, 1000000, 'Quantidade deve ser maior que zero'),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Preço',
                      hintText: 'Digite o preço no produto 2',
                    ),
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.numbersBetweenInterval(
                          1, 1000000, 'Preço deve ser maior que zero'),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () {
                      final isValid = formKey.currentState?.validate() ?? false;
                      if (isValid) {
                        print('valid');
                      }
                    },
                    child: const Text(
                      'COMPARAR',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(height: 12),
                  const Text(
                    'O preço do produto 1 é mais vantajoso',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
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
