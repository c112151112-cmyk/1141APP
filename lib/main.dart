import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的自傳"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: currentIndex==0? Image.asset('assets/a1.png', width: 40, height: 40,):Image.asset('assets/a11.png', width: 30, height: 30,), label:"自我介紹",),
          BottomNavigationBarItem(icon: currentIndex==1? Image.asset('assets/a2.png', width: 40, height: 40,):Image.asset('assets/a21.png', width: 30, height: 30,), label:"學習歷程",),
          BottomNavigationBarItem(icon: currentIndex==2? Image.asset('assets/a3.jpg', width: 40, height: 40,):Image.asset('assets/a31.jpg', width: 30, height: 30,), label:"學習計畫",),
          BottomNavigationBarItem(icon: currentIndex==3? Image.asset('assets/a4.png', width: 40, height: 40,):Image.asset('assets/a41.png', width: 30, height: 30,), label:"專業方向",),
        ],
        onTap: (index) {
          setState(() {
            previousIndex=currentIndex;
            currentIndex=index;
          });
        },
      ),
    );
  }
}

// ----------------------------------------------------
// Screen1 - 自我介紹
// ----------------------------------------------------
class Screen1 extends StatelessWidget {
  Screen1({super.key});

  final String s1="我出生在一個平凡卻溫暖的小家庭。父親是工廠的經理，母親是家庭主婦。姐姐已經出社會工作，而我還在求學中。父母的管教方式相當民主，他們希望我們能夠獨立自主、主動學習，累積生活經驗，也會在適當的時候給予鼓勵與建議。他們對我們只有一個要求：希望我們能過得快樂。由於家境並不富裕，因此更要專心學好一技之長，將來才能自立。"
      "從小看著父親在工廠管理與處理工作，我也曾嚮往能走上類似的職業方向。升學時，我原本也考慮過商科，但我發現自己不太擅長考試，對商科那種大量筆試的訓練並不適合。因此，我最後選擇了資訊科，希望未來能靠資訊技能找到穩定且收入良好的工作。進入資訊科後，雖然最初的動機是「為了將來能賺錢」，但在實作與課程的過程裡，我漸漸覺得每天都過得很充實，也從中獲得成就感。由於高職學生多半會升科大，我也持續努力學習，最後順利考上高科。";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //標題
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Text("Who am I", style: TextStyle(fontSize: 32,
                fontWeight: FontWeight.bold),
            ),
          ),
          //自傳部分
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3,),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6,6)),
              ],
            ),
            child: Text(s1, style: const TextStyle(fontSize: 20,)),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.redAccent,
            child: Image.asset('assets/a1.png'),
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(image: AssetImage('assets/a2.png'), fit: BoxFit.cover),
                ),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(image: AssetImage('assets/a3.jpg'), fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------
// Screen2 - 學習歷程
// ----------------------------------------------------
class Screen2 extends StatelessWidget {
  Screen2({super.key});

  final List<Map<String, String>> experiences = [
    {
      'title': '高職時期',
      'period': '2020.09 - 2023.06',
      'detail': '在高職三年，校內科目讓我把基本功打好。這段經歷成為我往資訊工程發展的基礎。',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "我的學習歷程",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                  elevation: 5,
                  color: Colors.lightBlue.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          experiences[index]['title']!,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '時間：${experiences[index]['period']!}',
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const Divider(height: 15, thickness: 1),
                        Text(
                          experiences[index]['detail']!,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


// ----------------------------------------------------
// Screen3 - 學習計畫
// ----------------------------------------------------
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, 
        children: [
          const Center(
            child: Text(
              "未來學習計畫",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          const SizedBox(height: 20,),

          Card(
            elevation: 5,
            color: Colors.lightBlue.shade100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "大一時期 ",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  ),
                  const Divider(height: 15, thickness: 1, color: Colors.amber),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    decoration: const BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.amber, width: 4)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("1. 程式語言：開始學習 C/C++ 與組合語言，打下未來寫程式的基礎。", style: const TextStyle(fontSize: 20,)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30,),

          Card(
            elevation: 5,
            color: Colors.green.shade100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "大二時期",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  ),
                  const Divider(height: 15, thickness: 1, color: Colors.redAccent),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    decoration: const BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.redAccent, width: 4)),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("1. 核心課程：學習資料結構、微處理機、系統程式等核心課程。", style: TextStyle(fontSize: 20,)),
                        Text("2. 網頁開發：深入學習 HTML/CSS/JavaScript，並掌握後端技術。", style: TextStyle(fontSize: 20,)),
                        Text("3. Java 學習：開始學習 Java 程式語言，為物件導向與企業級應用打下基礎。", style: TextStyle(fontSize: 20,)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30,),

          Card(
            elevation: 5,
            color: Colors.deepPurple.shade100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "大三時期",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  ),
                  const Divider(height: 15, thickness: 1, color: Colors.purple),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    decoration: const BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.purple, width: 4)),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("1. 畢業專題：確定畢業專題方向，組建團隊並開始研究開發。", style: TextStyle(fontSize: 20,)),
                        Text("2. 學習App 開發：學習行動應用開發， 配合 Flutter 建立跨平台框架。", style: TextStyle(fontSize: 20,)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30,),

          const SizedBox(height: 20,),
          Center(
            child: Image.asset('assets/a3.jpg', width: 250, height: 250,), 
          ),
          const SizedBox(height: 20,),

        ],
      ),
    );
  }
}

// ----------------------------------------------------
// Screen4 - 專業方向 
// ----------------------------------------------------
class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "專業方向與展望",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.purple),
          ),
          const SizedBox(height: 20),

          buildDirectionCard(
            context,
            '全端軟體開發工程師',
            '專注於網頁與應用程式的前後端設計、開發與維護。',
            'assets/a4.png', 
            Colors.lightBlue.shade100,
          ),

          const SizedBox(height: 20),

          buildDirectionCard(
            context,
            'AI 模型與資料專案工程師',
            '利用機器學習技術，並配合現在市場上的大型語言模型，開發 AI 專案與應用。',
            'assets/a2.png', 
            Colors.green.shade100,
          ),



          const SizedBox(height: 20),


        ],
      ),
    );
  }

  Widget buildDirectionCard(BuildContext context, String title, String detail, String imagePath, Color color) {
    return Card(
      elevation: 4,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    detail,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
