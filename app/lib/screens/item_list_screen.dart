import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/item_model.dart';
import 'ar_view_screen.dart';

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ItemModel> items = [
      ItemModel(
        'Pikachu',
        'I want to be Pikachu when I grow up.',
        'items/pika.png',
      ),
      ItemModel(
        'Bicycle',
        'I wonder if this bicycle is there.',
        'items/bicycle.png',
      ),
      ItemModel(
        'Devil',
        'Does the devil really exist?',
        'items/devil.png',
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'Flutter ARCore Sample',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 6,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ARViewScreen(
                            items[index].pic,
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.asset(
                              items[index].pic,
                              width: 60,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  items[index].name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  items[index].detail,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: items.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
