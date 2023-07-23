import 'dart:convert';

import 'package:burc/core/extensions/context_extensions.dart';
import 'package:burc/widgets/drop_down_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;

import '../widgets/burcuyumufield.dart';
import '../widgets/elevatedbutton.dart';

void main() {
  runApp(BurcYorumlariApp());
}

class BurcYorumlariApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dropdown ve API Örneği',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedOption1; // Set initial value to null
  String? selectedOption2; // Set initial value to null
  String compatibilityText = '';
  String harmony = '';
  String percent = '';
  bool isLoading = false;
  bool isBurcFieldVisible = false; // Track the visibility of BurcField
  bool isDropDownVisible = true;
  List<String> options1 = [
    'koc',
    'boga',
    'ikizler',
    'yengec',
    'aslan',
    'basak',
    'terazi',
    'akrep',
    'yay',
    'oglak',
    'kova',
    'balık'
  ];

  List<String> options2 = [
    'koc',
    'boga',
    'ikizler',
    'yengec',
    'aslan',
    'basak',
    'terazi',
    'akrep',
    'yay',
    'oglak',
    'kova',
    'balık'
  ];

  Future<void> fetchData(String option1, String option2) async {
    setState(() {
      isLoading = true;
      isDropDownVisible = false; // Hide the dropdown buttons
    });

    String formattedOption1 = option1.toLowerCase();
    String formattedOption2 = option2.toLowerCase();

    String apiUrl =
        'https://www.milliyet.com.tr/ask-uyumu/$formattedOption1-$formattedOption2-burc-uyumu';

    var response = await http.get(Uri.parse(apiUrl));
    var responseData = utf8.decode(response.bodyBytes);

    // Parse HTML content
    var document = htmlParser.parse(responseData);

    // Extract compatibility text
    var compatibilityElement =
        document.querySelector('.compatibility-result__content-inner p');
    if (compatibilityElement != null) {
      compatibilityText = compatibilityElement.text.trim();
    } else {
      compatibilityText = 'Compatibility information not found.';
      print(responseData);
    }
    var percentElement = document
        .querySelector('.compatibility-result__content-inner p:nth-child(1)');
    if (percentElement != null) {
      percent = percentElement.text.trim();
    } else {
      percent = 'Harmony information not found.';
      print(responseData);
    }
    var harmonyElement = document
        .querySelector('.compatibility-result__content-inner p:nth-child(2)');
    if (harmonyElement != null) {
      harmony = harmonyElement.text.trim();
    } else {
      harmony = 'Harmony information not found.';
      print(responseData);
    }
    setState(() {
      isLoading = false;
      isBurcFieldVisible = true; // Show BurcField after fetching data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Burç Uyumu'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bakground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: selectedOption1,
                  dropdownColor: Color(0x5903CC),
                  hint: DropDownTitle(text: 'Birinci Burç Seçin'),
                  onChanged: (newValue) {
                    setState(() {
                      selectedOption1 = newValue!;
                    });
                  },
                  items: options1.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: DropDownTitle(text: option),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                DropdownButton<String>(
                  dropdownColor: Color(0x5903CC),
                  value: selectedOption2,
                  hint: DropDownTitle(text: 'İkinci Burç Seçin'),
                  onChanged: (newValue) {
                    setState(() {
                      selectedOption2 = newValue!;
                    });
                  },
                  items: options2.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: DropDownTitle(text: option),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                ZodiaButton(
                  width1: Get.width*0.3,
                  text: 'İkinci Burç Seçin',
                  onPressed: () {
                    if (selectedOption2 != null) {
                      fetchData(selectedOption1!, selectedOption2!);
                    }
                  },
                ),
                SizedBox(height: 16),
                if (isBurcFieldVisible)
                  isLoading
                      ? CircularProgressIndicator()
                      : Visibility(
                          visible: isBurcFieldVisible,
                          child: Column(
                            children: [
                              BurcUyumuField(
                                bodyText: compatibilityText,
                                text: 'Burç Uyumu',
                                imageText: "assets/images/virgo (2).png",
                              ),
                              SizedBox(
                                height: context.mediumValue,
                              ),
                              BurcUyumuField(
                                  text: 'Burcun İlişki Durumu',
                                  bodyText: harmony,
                                  imageText:
                                      "assets/images/constellations.png"),
                              SizedBox(
                                height: context.mediumValue,
                              ),
                              BurcUyumuField(
                                  text: 'Burç Uyum Yüzdesi',
                                  bodyText: percent,
                                  imageText: "assets/images/tarot-card.png")
                            ],
                          ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
