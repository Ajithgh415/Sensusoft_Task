import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sensusofttask/GetDetailsProvider.dart';
import 'dart:math' as math;

import 'package:sensusofttask/jsonclassed/data.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    _loadInitial(context);
  }

  _loadInitial(BuildContext context) async {
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        final auth = Provider.of<GetDetailsProvider>(context, listen: false);
        auth.loadlistvalues();
      });
    });
  }

  Widget nearbyList() {
    return Consumer<GetDetailsProvider>(builder: (context, object, child) {
      List<Nearby> nearbyPage = object.getNearbyPage()!;
      return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: nearbyPage.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            nearbyPage[index].coverImage.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nearbyPage[index].name.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.location_on),
                                Text(
                                  nearbyPage[index].location.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                const Icon(Icons.star,
                                    color: Color(0xff23948E)),
                                Text(
                                  nearbyPage[index].averageRating.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.money_outlined),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "${nearbyPage[index].price}€",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(Icons.av_timer_outlined),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    nearbyPage[index].duration.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(Icons.import_export_outlined),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    nearbyPage[index].distance.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
    });
  }

  Widget popularlistWidget() {
    return Consumer<GetDetailsProvider>(builder: (context, object, child) {
      List<Popular> popularpage = object.getPopularPage()!;
      return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: popularpage.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            popularpage[index].coverImage.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularpage[index].name.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.location_on),
                                Text(
                                  popularpage[index].location.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                const Icon(Icons.star,
                                    color: Color(0xff23948E)),
                                Text(
                                  popularpage[index].averageRating.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.money_outlined),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "${popularpage[index].price}€",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(Icons.av_timer_outlined),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    popularpage[index].duration.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(Icons.import_export_outlined),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    popularpage[index].distance.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetDetailsProvider>(builder: (context, object, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff23948E),
          title: const Text("Travel"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0, top: 8, bottom: 8),
                  child: Text(
                    'Nearby',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              nearbyList(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    object.increaseNearcount();
                  });
                },
                child: const Text('Load More Nearby'),
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0, bottom: 8, top: 8),
                  child: Text(
                    'Popular',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              popularlistWidget(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    object.increasePopularcount();
                  });
                },
                child: const Text('Load More Popular'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
