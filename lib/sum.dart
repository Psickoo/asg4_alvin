import 'package:flutter/material.dart';
import 'cart.dart';
import 'cart_page.dart';
import 'menu.dart';

class SecondPage extends StatefulWidget {
  final Menu menuItem;
  final Cart cart;

  const SecondPage({Key? key, required this.menuItem, required this.cart})
      : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  void onSubmitted(String value) {
    setState(() {
      fileAmount.name = value;
    });
  }

  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menuItem.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              final amount = int.tryParse(_controller1.text) ?? 0;
              final totalAmount = amount * widget.menuItem.amount;
              final notes = _controller2.text;

              final cartItem = CartItem(
                totalAmount: totalAmount,
                notes: notes,
                menuItem: widget.menuItem,
              );

              widget.cart.addItem(cartItem);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: widget.cart),
                ),
              );
            },
          )
        ],
        backgroundColor: Color.fromARGB(169, 77, 255, 86),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Amount'),
                    margin: EdgeInsets.all(10),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: TextField(
                      controller: _controller1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: _controller1.clear,
                          icon: const Icon(Icons.clear),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: 'Input Amount',
                      ),
                      onSubmitted: onSubmitted,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text('Notes'),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: TextField(
                    controller: _controller2,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: _controller2.clear,
                        icon: const Icon(Icons.clear),
                      ),
                      border: const OutlineInputBorder(),
                      labelText: 'Input Notes',
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total'),
                    Text(
                      'Rp. ${widget.menuItem.amount * (int.tryParse(_controller1.text) ?? 0)}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class fileAmount {
  static String name = "";
}
