import 'package:flutter/material.dart';
import 'cart.dart';
import 'menu.dart';
import 'sum.dart';
import 'cart_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<Menu> _menu = [
    Menu(title: 'nasiGoreng', amount: 12000),
    Menu(title: 'Buncis', amount: 4000),
    Menu(title: 'esTeh', amount: 3000)
  ];

  final Cart _cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text(
          'Menu',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Color.fromARGB(183, 0, 255, 13),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CartPage(
                        cart: _cart,
                      )));
        },
        child: Icon(
          Icons.shopping_cart,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        backgroundColor: Color.fromARGB(255, 156, 156, 156),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          elevation: 2,
          child: ListTile(
              title: Text(_menu[index].title),
              trailing: Text('Rp. ${_menu[index].amount}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondPage(
                            menuItem: _menu[index],
                            cart: _cart,
                          )),
                );
              }),
        ),
        itemCount: _menu.length,
      ),
    );
  }
}
