import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logic_translator/screen/translator/provider/translator_provider.dart';
import 'package:logic_translator/util/app_routes.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TranslatorProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_Routes,
      ),
    )
  );
}