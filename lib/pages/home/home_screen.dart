import 'dart:ui';

import 'package:api_rest_app/models/supizza.dart';
import 'package:api_rest_app/services/api_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<SupizzaModel> _supizzaModel;

  @override
  void initState() {
    _supizzaModel = ApiManager().gerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supizza'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
              image: AssetImage('assets/images/pizza-patter.jpg'),
              repeat: ImageRepeat.repeat),
        ),
        child: FutureBuilder(
          future: _supizzaModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.pizzas.length,
                itemBuilder: (BuildContext context, int index) {
                  var pizza = snapshot.data.pizzas[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Pizza(pizza: pizza),
                  );
                },
              );
            } else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class Pizza extends StatelessWidget {
  const Pizza({
    Key key,
    @required this.pizza,
  }) : super(key: key);

  final pizza;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.grey.shade100.withOpacity(0.1),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            margin: EdgeInsets.all(10.0),
            height: 100,
            child: Row(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.transparent,
                  elevation: 0,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                        pizza.urlImg.small,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pizza.nombre,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        pizza.descripcion,
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Container(
                        height: 20.0,
                        width: 120.0,
                        child: ListView.builder(
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            var ingrediente = pizza.ingredientes[index];
                            return Container(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(ingrediente.urlImg.small),
                                  ),
                                  Text(ingrediente.nombre)
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
