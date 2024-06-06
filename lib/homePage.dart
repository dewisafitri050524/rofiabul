import 'package:flutter/material.dart';
import 'package:myapp/loginPage.dart';
import 'package:myapp/webView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token = "pppp";
  void goo() {}
  String namaDepan = "Rafi";
  @override
  void initState() {
    super.initState();
    // _loadToken();
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _loadTokens() async {
    // String? token = await SharedPreferences.getInstance();
    // setState(() {
    //   _token = token;
    // });
  }

  String nama = 'ROfi ABul Hasani token';
  Future _loadToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    nama = pref.getString('token').toString();
    print(nama);
    setState(() {});
  }

  Future _clearToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.only(top: 80, left: 25, right: 25),
                child: ListTile(
                  // leading: Image.network(''),
                  title: ElevatedButton(
                      onPressed: () {
                        _loadToken();
                      },
                      child: Text('$nama')),
                  subtitle: ElevatedButton(
                      onPressed: () {
                        _clearToken();
                      },
                      child: Text('$token')),
                  trailing: TextButton(
                    child: Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _clearToken();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Loginpage()));
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                children: [
                  TextButton(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.app_registration,
                            size: 62,
                            color: Colors.white,
                          ),
                          Text(
                            "Web View",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      print('Web View');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WebView()));
                    },
                  ),
                  TextButton(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.date_range_rounded,
                            size: 62,
                            color: Colors.white,
                          ),
                          Text(
                            "Aplikasi B",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      print('Open Browser');
                      _launchURL('https://www.flutter.dev');
                    },
                  ),
                  TextButton(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings_system_daydream_sharp,
                            size: 62,
                            color: Colors.white,
                          ),
                          Text(
                            "Aplikasi C",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_to_queue,
                            size: 62,
                            color: Colors.white,
                          ),
                          Text(
                            "Aplikasi D",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 32),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              size: 32,
            ),
            label: 'Layanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_applications,
              size: 32,
            ),
            label: 'Pengaturan',
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        // onTap: _onItemTapped,
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
