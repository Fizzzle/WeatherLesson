import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          iconTheme: IconThemeData(color: Colors.black54),
          brightness: Brightness.light,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperatureForecast(),
                Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage(
        'https://24tv.ua/resources/photos/news/202207/2064220.jpg?v=1656838677000&w=1200&h=675&fit=cover'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Tuesday - May 22',
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(),
      Text(
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis.',
          style: TextStyle(color: Colors.black54)),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      SizedBox(
        width: 16,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '15 Clear',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
          Row(
            children: [
              Text('Odeskaya obl, Odesa', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text(
          '${index + 20}C',
          style: TextStyle(fontSize: 15.0),
        ),
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blueAccent,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.black,
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.black,
      ),
    ],
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        'Info with openthermap.org',
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
      stars,
    ],
  );
}
