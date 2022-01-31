import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Size screen;

  List items = [
    {
      "text": "Car",
      "info": [
        {"image": "assets/744465.png"},
        {"image": "assets/744465.png"},
        {"image": "assets/744465.png"},
      ]
    },
    {
      "text": "Apple",
      "info": [
        {"image": "assets/apple.png"},
        // {"image": "assets/apple.png"},
      ]
    },
    {
      "text": "T-shirt",
      "info": [
        {"image": "assets/744465.png"},
        {"image": "assets/744465.png"},
        {"image": "assets/744465.png"},
      ]
    },
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text(
          "Gebeya",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.card_travel_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.card_travel_outlined))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: screen.height * 0.3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return myCard(items[index], index);
                }),
          ),
          Text(
            items[selected]['text'],
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
              height: screen.height * 0.5,
              child: ListView.builder(
                  itemCount: items[selected]['info'].length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      height: screen.height * 0.3,
                      width: screen.width * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(width: 5),
                          // color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        children: [
                          Container(
                            height: screen.height * 0.2,
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(items[selected]['info'][index]
                                        ['image']),
                                    Positioned(
                                        left: 60,
                                        top: screen.height * 0.13,
                                        child: Text(
                                          "#No More",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Model: Rava4",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "price: 2.5M",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Speed: nvds",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.lightGreen,
                                    child: Icon(Icons.home)),
                                Icon(Icons.home),
                                Icon(Icons.home),
                                Icon(Icons.home),
                                Icon(Icons.home),
                                Icon(Icons.home),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Image.asset("assets/apple.png"),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    child: Image.asset("assets/apple.png"),
                  ),
                  CircleAvatar(
                    child: Image.asset("assets/apple.png"),
                  ),
                  CircleAvatar(
                    child: Image.asset("assets/apple.png"),
                  ),
                  CircleAvatar(
                    child: Image.asset("assets/apple.png"),
                  ),
                  CircleAvatar(
                    child: Image.asset("assets/apple.png"),
                  ),
                ],
                accountName: Text("Robel"),
                accountEmail: Text("robelwo@gmail.com")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
          ],
        ),
      ),
    );
  }

  Widget myCard(data, index) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        height: 200,
        width: screen.width * 0.4,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.grey[500],
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data["text"],
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
