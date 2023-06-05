import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Bookmark Manager';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<Category> categories = [
    Category(name: "Tutorial"),
    Category(name: "Food"),
    Category(name: "Algorithm"),
  ];

  List<Bookmark> bookMarks = [
    Bookmark(title: "Javascript", url: "www.abc.com", cat: "Tutorial"),
    Bookmark(title: "Nodejs", url: "www.abc.com", cat: "Tutorial"),
    Bookmark(title: "Database", url: "www.abc.com", cat: "Tutorial"),
    Bookmark(title: "Dhaka Food", url: "www.abc.com", cat: "Food"),
    Bookmark(title: "Indian Food", url: "www.abc.com", cat: "Food"),
    Bookmark(title: "Supervised", url: "www.abc.com", cat: "Algorithm"),
    Bookmark(title: "Unsupervised", url: "www.abc.com", cat: "Algorithm"),
    Bookmark(title: "Generic", url: "www.abc.com", cat: "Algorithm"),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmark Manager'),
      ),

      // main body start
      //
      body: SingleChildScrollView(
        child: Column(
            children: categories.map((category) {
          return Container(
            child: Column(
              children: [
                Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Column(
                  children: bookMarks.where((bookmark) {
                    return bookmark.cat == category.name;
                  }).map((bookmark) {
                    return Container(
                      child: ListTile(
                        title: Text("Title: " + bookmark.title),
                        subtitle: Text("URL: " + bookmark.url),
                      ),
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      color: Color(0xfff2f8f9),
                    );
                  }).toList(),
                ),
              ],
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            color: Colors.green[100],
          );
        }).toList()),
      ),

      // floting action button start
      //floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        //onPressed: _incrementCounter,

        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Stack(
                    children: [
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.close),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                      Form(
                          child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Add BookMark"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              decoration:
                                  InputDecoration(hintText: "Enter Title"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              decoration:
                                  InputDecoration(hintText: "Enter URL"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(hintText: "Category"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Flexible(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  flex: 1,
                                ),
                                Flexible(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Save"),
                                  ),
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                );
              });
        },
        //tooltip: 'Increment',
        //child: Icon(Icons.add),
        icon: Icon(Icons.add),
        label: Text(
          'Add Bookmark',
          style: TextStyle(
            fontSize: 14,
          ),
        ),

        //child: const Text("Add Bookmark"),
      ),
    );
  }
}

class Bookmark {
  String title, url, cat;
  Bookmark({required this.title, required this.url, required this.cat});
}

class Category {
  String name;
  Category({required this.name});
}
