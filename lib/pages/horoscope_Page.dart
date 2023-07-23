import 'package:burc/widgets/signdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/burc_detail.dart';
import '../widgets/burc_detail_button.dart';
import 'homepage.dart';

class HoroscopePage extends StatefulWidget {
  final String sign;

  HoroscopePage({required this.sign});

  @override
  _HoroscopePageState createState() => _HoroscopePageState();
}

class _HoroscopePageState extends State<HoroscopePage> {
  late ZodiacSign selectedSign;
  late Future<List<String>> _futureHoroscope;
  String _selectedPeriod = 'gunluk'; // Default period is 'gunluk'

  @override
  void initState() {
    super.initState();

    _futureHoroscope = fetchHoroscope(widget.sign, _selectedPeriod);
  }

  void _selectPeriod(String period) {
    setState(() {
      _selectedPeriod = period;
      _futureHoroscope = fetchHoroscope(widget.sign, _selectedPeriod);
    });
  }

  void _showDetails() {
    selectedSign = zodiacSigns.firstWhere(
      (sign) => sign.name == widget.sign,
      orElse: () => ZodiacSign(name: '', description: selectedSign.description),
    );
    setState(() {
      _selectedPeriod = 'ozellikler';
    });
  }

  Widget _buildHoroscopeList() {
    return FutureBuilder<List<String>>(
      future: _futureHoroscope,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          List<String> horoscopeList = snapshot.data!;
          return ListView.builder(
            itemCount:
                _selectedPeriod == 'ozellikler' ? 1 : horoscopeList.length,
            itemBuilder: (context, index) {
              if (_selectedPeriod == 'ozellikler') {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BurcDetail(
                    text: '${widget.sign.toUpperCase()}',
                    bodyText: '${selectedSign.description}',
                    imageText: 'assets/images/${widget.sign}s.png',
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BurcDetail(
                    text: '${widget.sign.toUpperCase()}',
                    bodyText: '${horoscopeList[index]}',
                    imageText: 'assets/images/${widget.sign}s.png',
                  ),
                );
              }
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("widget.sign: ${widget.sign}");

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '${widget.sign.toUpperCase()} Burcu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bakground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: context.height * 0.15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        text: 'Günlük',
                        onPressed: () => _selectPeriod('gunluk'),
                        isSelected: _selectedPeriod == 'gunluk',
                      ),
                    ),
                    CustomElevatedButton(
                      text: 'Haftalık',
                      onPressed: () => _selectPeriod('haftalik'),
                      isSelected: _selectedPeriod == 'haftalik',
                    ),
                    CustomElevatedButton(
                      text: 'Aylık',
                      onPressed: () => _selectPeriod('aylik'),
                      isSelected: _selectedPeriod == 'aylik',
                    ),
                    CustomElevatedButton(
                      text: 'Özellikler',
                      onPressed: _showDetails,
                      isSelected: _selectedPeriod == 'ozellikler',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _buildHoroscopeList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
