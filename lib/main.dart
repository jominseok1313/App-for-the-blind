import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CureEYE DEMO'),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: GridView.count(
            crossAxisCount: 2, // 1개 행에 항목 3개씩
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 1,
            padding:
                const EdgeInsets.only(bottom: 0, left: 15, top: 100, right: 15),
            children: [
              InkWell(
                onTap: () async {
                  await flutterTts.speak('포장지 인식');
                },
                onDoubleTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BarcodePage()),
                  );
                },
                highlightColor: Colors.blue, // 터치할 때 버튼 주변에 반짝거리는 애니메이션 생성
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: const Icon(
                    Icons.qr_code_scanner,
                    size: 160,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await flutterTts.speak('알약 인식');
                },
                onDoubleTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BarcodePage()),
                  );
                },
                highlightColor: Colors.blue, // 탭할 때 버튼 주변에 파란색 원형 애니메이션 생성
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: const Icon(
                    Icons.medication,
                    size: 180,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await flutterTts.speak('소리 설정');
                },
                onDoubleTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BarcodePage()),
                  );
                },
                highlightColor: Colors.blue, // 탭할 때 버튼 주변에 파란색 원형 애니메이션 생성
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: const Icon(
                    Icons.volume_up,
                    size: 180,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await flutterTts.speak('화면 설정');
                },
                onDoubleTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DisplayPage()),
                  );
                },
                highlightColor: Colors.blue, // 탭할 때 버튼 주변에 파란색 원형 애니메이션 생성
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: const Icon(
                    Icons.settings_brightness,
                    size: 180,
                  ),
                ),
              ),
            ]));
  }
}

class BarcodePage extends StatefulWidget {
  const BarcodePage({Key? key}) : super(key: key);

  @override
  State<BarcodePage> createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CureEYE DEMO'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    result = res;
                  }
                });
              },
              child: const Text('Camera'),
            ),
            Text('Barcode Result: $result'),
          ],
        ),
      ),
    );
  }
}

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key? key}) : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CureEYE DEMO'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: GridView.count(
          crossAxisCount: 2, // 1개 행에 항목 3개씩
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 1,
          padding:
              const EdgeInsets.only(bottom: 0, left: 15, top: 100, right: 15),
          children: [
            InkWell(
              onTap: () async {
                await flutterTts.speak('검은색');
              },
              onDoubleTap: () {
                print("색상변환");
              },
              highlightColor: Colors.blue, // 탭할 때 버튼 주변에 파란색 원형 애니메이션 생성
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: const Icon(
                  Icons.contrast,
                  color: Colors.black,
                  size: 170,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await flutterTts.speak('파란색');
              },
              onDoubleTap: () {
                print("색상변환");
              },
              highlightColor: Colors.blue, // 탭할 때 버튼 주변에 파란색 원형 애니메이션 생성
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: const Icon(
                  Icons.contrast,
                  color: Colors.blue,
                  size: 170,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await flutterTts.speak('빨간색');
              },
              onDoubleTap: () {
                print("색상변환");
              },
              highlightColor: Colors.blue, // 탭할 때 버튼 주변에 파란색 원형 애니메이션 생성
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: const Icon(
                  Icons.contrast,
                  color: Colors.red,
                  size: 170,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await flutterTts.speak('초록색');
              },
              onDoubleTap: () {
                print("색상변환");
              },
              highlightColor: Colors.blue, // 탭할 때 버튼 주변에 파란색 원형 애니메이션 생성
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: const Icon(
                  Icons.contrast,
                  color: Colors.green,
                  size: 170,
                ),
              ),
            ),
          ]),
    );
  }
}
