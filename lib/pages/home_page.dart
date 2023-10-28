import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../model/product_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

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
                        controller.product1 = ProductModel.fromString(
                          quantity: teQuant1.text,
                          price: tePrice1.text,
                        );
                        controller.product2 = ProductModel.fromString(
                          quantity: teQuant2.text,
                          price: tePrice2.text,
                        );
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
                    visible: controller.isValid,
                    child: Text(
                      controller.productAdvantageous,
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
