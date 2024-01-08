import 'package:flutter/material.dart';
import 'package:logic_translator/screen/translator/provider/translator_provider.dart';
import 'package:provider/provider.dart';

class TranslaterScreen extends StatefulWidget {
  const TranslaterScreen({super.key});

  @override
  State<TranslaterScreen> createState() => _TranslaterScreenState();
}

class _TranslaterScreenState extends State<TranslaterScreen> {
  TranslatorProvider? providerr;
  TranslatorProvider? providerw;

  @override
  Widget build(BuildContext context) {
    providerr = context.read<TranslatorProvider>();
    providerw = context.watch<TranslatorProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Logic Translator"),
          centerTitle: true,
          backgroundColor: Colors.blue.shade400,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await providerr!.getTranslatorData();
                },
                child: Text("Translator"),
              ),
              Text(providerw!.translatorModel == null ? "pleas.." : "${providerw!.translatorModel!.dataModel!.translatedText}"),
            ],
          ),
        ),
      ),
    );
  }
}
