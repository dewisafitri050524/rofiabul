import 'package:flutter/material.dart';
// import 'package:flutter_dolkode_3/model/dokter_model.dart';
// import 'package:flutter_dolkode_3/class/repository.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Repository {
  final _baseUrlPasien =
      "https://65e64f47d7f0758a76e8568b.mockapi.io/dolkode/data_pasien";
  final _baseUrl = "https://665fcd595425580055b0edb9.mockapi.io/users";

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        print('respon API');
        print('dataaa ini' + response.body);
        Iterable it = jsonDecode(response.body);

        List<DokterModels> userData =
            it.map((e) => DokterModels.fromJson(e)).toList();
        return userData;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postDataPasien(String nama, String nik) async {
    try {
      final response = await http
          .post(Uri.parse(_baseUrlPasien), body: {"nama": nama, "nik": nik});
      print('nama ==' + nama + ' ==nik ==' + nik);
      print(response);

      // final response = await dio.post(_baseUrlPasien, data: {
      //   'nama': nama,
      //   'nik': nik,
      // });

      // return response.data;
      if (response == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString);
    }
  }
}

class DokterModels {
  String id;
  String username;
  String email;

  DokterModels({
    required this.id,
    required this.username,
    required this.email,
  });
  factory DokterModels.fromJson(Map<String, dynamic> json) {
    return DokterModels(
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }
}

class GetDataPage extends StatefulWidget {
  // const JadwalDokter({super.key});

  @override
  State<GetDataPage> createState() => _GetDataPageState();
}

class _GetDataPageState extends State<GetDataPage> {
  List<DokterModels> DokterData = [];

  Repository repository = Repository();

  getData() async {
    print('sambung');
    DokterData = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    print('konek');

    print(DokterData);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Data User'),
      ),
      body: ListView.builder(
        itemCount: DokterData.length,
        itemBuilder: (context, index) => Card(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            color: Colors.amber,
            child: ListTile(
              title: Text('${DokterData[index].username}'),
              leading: Text('${DokterData[index].email}'),
            )),
      ),
    );
  }
}
