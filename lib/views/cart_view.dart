import 'package:get_builder_state_management_getx/utils/export.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void dispose() {
    Hive.box<CartModel>('cart').close;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('cart Items'), centerTitle: true),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<CartModel>('cart').listenable(),
        builder: (context, box, _) {
          final cartBox = Hive.box<CartModel>('cart');
          return ListView.builder(
            padding: const EdgeInsets.all(6),
            itemCount: cartBox.length,
            itemBuilder: (context, index) {
              final cart = cartBox.getAt(index);
              return Card(
                elevation: 3,
                child: ListTile(
                  leading: Image.asset(cart!.productImage!),
                  title: Text(cart.productTitle!),
                  subtitle: Text('\$ ${cart.productPrice.toString()}'),
                  trailing: IconButton(
                    onPressed: () {
                      cartBox.deleteAt(index);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
