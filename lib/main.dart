import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensusofttask/GetDetailsProvider.dart';
import 'package:sensusofttask/loginPage.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GetDetailsProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: LoginPage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List 1
  List<NearBy> _nearbyList = [
    NearBy(id: 1, name: 'Nearby 1', description: 'Description 1'),
    NearBy(id: 2, name: 'Nearby 2', description: 'Description 2'),
    NearBy(id: 3, name: 'Nearby 3', description: 'Description 3'),
    NearBy(id: 4, name: 'Nearby 4', description: 'Description 4'),
    NearBy(id: 5, name: 'Nearby 5', description: 'Description 5'),
    NearBy(id: 6, name: 'Nearby 6', description: 'Description 6'),
    NearBy(id: 7, name: 'Nearby 7', description: 'Description 7'),
    NearBy(id: 8, name: 'Nearby 8', description: 'Description 8'),
    NearBy(id: 9, name: 'Nearby 9', description: 'Description 9'),
    NearBy(id: 10, name: 'Nearby 10', description: 'Description 10'),
  ];

  // List 2
  List<PopulaR> _popularList = [
    PopulaR(id: 1, name: 'Popular 1', description: 'Description 1'),
    PopulaR(id: 2, name: 'Popular 2', description: 'Description 2'),
    PopulaR(id: 3, name: 'Popular 3', description: 'Description 3'),
    PopulaR(id: 4, name: 'Popular 4', description: 'Description 4'),
    PopulaR(id: 5, name: 'Popular 5', description: 'Description 5'),
    PopulaR(id: 6, name: 'Popular 6', description: 'Description 6'),
    PopulaR(id: 7, name: 'Popular 7', description: 'Description 7'),
    PopulaR(id: 8, name: 'Popular 8', description: 'Description 8'),
    PopulaR(id: 9, name: 'Popular 9', description: 'Description 9'),
    PopulaR(id: 10, name: 'Popular 10', description: 'Description 10'),
  ];

  // Pagination variables
  int _nearbyPage = 0;
  int _popularPage = 0;
  int _pageSize = 2;

  // Pagination functions
  List<NearBy> _getNearbyPage() {
    int start = _nearbyPage * _pageSize;
    int end = (start + _pageSize) > _nearbyList.length
        ? _nearbyList.length
        : (start + _pageSize);
    return _nearbyList.sublist(0, end);
  }

  List<PopulaR> _getPopularPage() {
    int start = _popularPage * _pageSize;
    int end = (start + _pageSize) > _popularList.length
        ? _popularList.length
        : (start + _pageSize);
    if (_popularList.isEmpty) {
      return _popularList.sublist(0, _popularList.length);
    }
    return _popularList.sublist(0, end);
  }

  // UI functions
  Widget _buildNearbyListView() {
    List<NearBy> nearbyPage = _getNearbyPage();
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: nearbyPage.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(nearbyPage[index].name!),
          subtitle: Text(nearbyPage[index].description!),
        );
      },
    );
  }

  Widget _buildPopularListView() {
    List<PopulaR> popularPage = _getPopularPage();
    return ListView.builder(
      itemCount: popularPage.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(popularPage[index].name!),
          subtitle: Text(popularPage[index].description!),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Travel App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Travel App'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nearby',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                _buildNearbyListView(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _nearbyPage++;
                    });
                  },
                  child: Text('Load More Nearby'),
                ),
                SizedBox(height: 16),
                Text(
                  'Popular',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                _buildPopularListView(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _popularPage++;
                    });
                  },
                  child: Text('Load More Popular'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NearBy {
  int? id;
  String? description;
  String? name;

  NearBy({this.id, this.name, this.description});
}

class PopulaR {
  int? id;
  String? description;
  String? name;

  PopulaR({this.id, this.name, this.description});
}
