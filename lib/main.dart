import 'package:flutter/material.dart';
import 'package:konversi_suhu_list/widget/input.dart';
import 'package:konversi_suhu_list/widget/riwayatSuhu.dart';
import 'package:konversi_suhu_list/widget/hasilSuhu.dart';
import 'package:konversi_suhu_list/widget/tombolSuhu.dart';
import 'package:konversi_suhu_list/widget/targetSuhu.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // final String title;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//untuk konversi suhu dengan list view
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ['Kelvin', 'Reamur', 'Farenheit'];
  String selectedDropDown = 'Kelvin';
  int hasilPerhitungan = 0;
  List<String> listHasil = <String>[];

  void onDropDownChanged(Object? value) {
    return setState(() {
      selectedDropDown = value.toString();
    });
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropDown) {
          case 'Kelvin':
            hasilPerhitungan = int.parse(etInput.text) + 273;
            break;
          case 'Reamur':
            hasilPerhitungan = (int.parse(etInput.text) * 4);
            break;
          case 'Farenheit':
            hasilPerhitungan = (int.parse(etInput.text) * 9) + 32;
            break;
          default:
        }
        listHasil.add(selectedDropDown + " : " + hasilPerhitungan.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu dengan List View',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konversi Suhu Dengan List View'),
        ),
        body: Container(
            margin: const EdgeInsets.all(8),
            child: Column(children: [
              Input(etInput: etInput),
              targetSuhu(
                selectedDropDown: selectedDropDown,
                listSatuanSuhu: listSatuanSuhu,
                onDropDownChanged: onDropDownChanged,
                konversiSuhu: konversiSuhu,
              ),
              hasilSuhu(hasilPerhitungan: hasilPerhitungan),
              tombolSuhu(
                konversiSuhu: konversiSuhu,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Riwayat Konversi Suhu',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              riwayatSuhu(listHasil: listHasil)
            ])),
      ),
    );
  }
}
