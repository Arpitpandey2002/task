import 'package:flutter/material.dart';
import 'package:task/MyForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white, background: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ADD SHIFT'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController? _tabController;
  List<Tab> myTabs = <Tab>[
    Tab(
      text: 'SHIFT INFO',
    ),
    Tab(text: 'SHIFT'),
  ];
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.arrow_back),
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                  backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                  surfaceTintColor:
                      MaterialStatePropertyAll(Colors.transparent)),
              child: Text(
                "Publish",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.deepPurple),
                  ))),
              child: Text(
                "Save",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.deepPurple),
              )),
          SizedBox(
            width: 20,
          ),
        ],
        bottom: TabBar(
          // tabAlignment: TabAlignment.start,
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Container(child: MyDropdownWidget()),
              Container(
                color: Colors.grey.shade100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Schedule Shifts",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                          color: Colors.grey),
                    ),
                    Icon(Icons.keyboard_arrow_down_sharp)
                  ],
                ),
              ),

              // calling the MyList inside the container widget

              Flexible(
                flex: 1,
                child: Container(
                  child: MyList(),
                ),
              ),

              Flexible(
                flex: 5,
                child: Container(
                  child: FormSection(),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// list tile

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color.fromRGBO(191, 85, 98, 1),
              child: Text(
                '0',
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Container(
              margin: EdgeInsets.only(top: 30),
              child: const Text(
                '07 World tech Tower',
                style: TextStyle(
                    color: Colors.black,
                    // fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: const Text(
              'World Tech Tower, Lakhnau Pind Road, Industrial Area Sector 74, Sahibzada Ajit Singh Nagar, Panjab',
              style: TextStyle(fontSize: 13),
            ),
            onTap: () {}),
      ],
    );
  }
}
