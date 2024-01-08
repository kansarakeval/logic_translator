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

  TextEditingController txtedit = TextEditingController();

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  value: providerw!.tran,
                    items: List.generate(
                      providerw!.lang.length,
                      (index) => DropdownMenuItem(
                        child: Text("${providerw!.lang[index]}"),
                        value: providerw!.lang[index],
                      ),
                    ),
                    onChanged: (value) {
                      providerr!.languageTran(value!);
                    },),
                TextField(
                  controller: txtedit,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Text enter..")),
                  maxLines: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  providerw!.translatorModel == null
                      ? "pleas.."
                      : "${providerw!.translatorModel!.dataModel!.translatedText}",
                  maxLines: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String edit = txtedit.text;
                    await providerr!.getTranslatorData(edit);
                  },
                  child: Text("Translator"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
