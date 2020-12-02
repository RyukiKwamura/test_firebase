// 共通機能
// タイトル画面

//Todo 将来的には初回起動時しか表示しないようにする

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:mycookbook/qr_generation.dart';
import 'package:mycookbook/qr_reader.dart';
import 'package:mycookbook/tutorial.dart';
import 'package:mycookbook/user_entry.dart';
import 'package:mycookbook/user_home.dart';
import 'package:mycookbook/user_switching.dart';

import 'admin_home.dart';
import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //getAndroidInfo();
  runApp(MyApp());
}

Future<void> getAndroidInfo() async {
  var deviceInfo = DeviceInfoPlugin();
  var androidInfo = await deviceInfo.androidInfo;
  print('Running on ${androidInfo.androidId}'); // => Android デバイスID出力
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '待ちジュン',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => MainPage(),
        '/tutorial': (context) => Tutorial(),
        '/subpage': (context) => SwitchPage(),
        '/userEntry': (context) => UserEntry(),
        '/login': (context) => Login(),
        '/qr_reader': (context) => QrReaderPage(),
        '/qr_generate': (context) => QrGenerationPage(),
        '/user_home': (context) => UserHome(),
        '/admin_home': (context) => AdminHome(),
        '/licensePage':(context) => const LicensePage()
      },
    );
  }
}

class MainPage extends StatelessWidget {
  final String _appBarName = '待ちジュン-チュートリアル';
  final List<String> _buttonTitle = ['チュートリアルを見る', 'チュートリアル', 'チュートリアルを終わる','ライセンス表示'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarName),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_buttonTitle[0]),
              RaisedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/tutorial'),
                child: Text(_buttonTitle[1]),
              ),
              RaisedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/subpage'),
                child: Text(_buttonTitle[2]),
              ),
              RaisedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/licensePage'),
                child: Text(_buttonTitle[3]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
