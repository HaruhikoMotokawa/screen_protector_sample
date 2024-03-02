import 'package:flutter/material.dart';
import 'package:screen_protector/screen_protector.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

/// ホーム画面
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Container(
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PreventScreenshotOnPage()));
                },
                child: const Text('PreventScreenshotOnPage')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ProtectDataLeakageWithColorPage()));
                },
                child: const Text('ProtectDataLeakageWithColorPage')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyBestPage()));
                },
                child: const Text('MyBestPage'))
          ],
        ),
      ),
    );
  }
}

class PreventScreenshotOnPage extends StatefulWidget {
  const PreventScreenshotOnPage({super.key});

  @override
  State<PreventScreenshotOnPage> createState() =>
      _PreventScreenshotOnPageState();
}

class _PreventScreenshotOnPageState extends State<PreventScreenshotOnPage> {
  @override
  void initState() {
    super.initState();
    // 💡 画面保護メソッドをオン
    ScreenProtector.preventScreenshotOn();
  }

  @override
  void dispose() {
    super.dispose();
    // 💡 画面保護メソッドをオフ
    ScreenProtector.preventScreenshotOff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PreventScreenshotOnPage'),
      ),
      body: Center(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                        'iOS\nスクショと画面収録は黒塗りになる\nマルチタスク画面のスクショ&録画も黒塗りされる\nマルチタスク画面の表示は【黒塗りされない】'),
                  ),
                  Text(
                      'Android\nスクショと画面収録は黒塗りになる\nマルチタスク画面の撮影&録画はシステムでブロック\nマルチタスク画面の最初の表示は【黒塗りされない】\n別アプリからのマルチタスク画面は【黒塗りされる】'),
                ],
              ))),
    );
  }
}

class ProtectDataLeakageWithColorPage extends StatefulWidget {
  const ProtectDataLeakageWithColorPage({super.key});

  @override
  State<ProtectDataLeakageWithColorPage> createState() =>
      _ProtectDataLeakageWithColorPageState();
}

class _ProtectDataLeakageWithColorPageState
    extends State<ProtectDataLeakageWithColorPage> {
  @override
  void initState() {
    super.initState();
    // 💡 機能をオン
    ScreenProtector.protectDataLeakageWithColor(Colors.blue);
  }

  @override
  void dispose() {
    super.dispose();
    // 💡 機能をオフ
    ScreenProtector.protectDataLeakageWithColorOff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProtectDataLeakageWithColorPage'),
      ),
      body: Center(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text('iOS\nマルチタスク画面の【表示が青になる】'),
                  ),
                  Text('Android\n影響なし'),
                ],
              ))),
    );
  }
}

class MyBestPage extends StatefulWidget {
  const MyBestPage({super.key});

  @override
  State<MyBestPage> createState() => _MyBestPageState();
}

class _MyBestPageState extends State<MyBestPage> {
  @override
  void initState() {
    // 💡 機能をオン
    super.initState();
    ScreenProtector.preventScreenshotOn();
    ScreenProtector.protectDataLeakageWithColor(Colors.black);
  }

  @override
  void dispose() {
    super.dispose();
    // 💡 機能をオフ
    ScreenProtector.preventScreenshotOff();
    ScreenProtector.protectDataLeakageWithColorOff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyBestPage'),
      ),
      body: Center(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                        'iOS\nスクショと画面収録は黒塗りになる\nマルチタスク画面のスクショ&録画も黒塗りされる\nマルチタスク画面の表示は【黒塗りされる】'),
                  ),
                  Text(
                      'Android\nスクショと画面収録は黒塗りになる\nマルチタスク画面の撮影&録画はシステムでブロック\nマルチタスク画面の最初の表示は【黒塗りされない】\n別アプリからのマルチタスク画面は【黒塗りされる】'),
                ],
              ))),
    );
  }
}