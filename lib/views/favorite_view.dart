import 'package:get_builder_state_management_getx/utils/export.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void dispose() {
    Hive.box<FavoriteModel>('favourite').close;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites'), centerTitle: true),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<FavoriteModel>('favourite').listenable(),
        builder: (context, box, _) {
          final favoriteBox = Hive.box<FavoriteModel>('favourite');
          return ListView.builder(
            padding: const EdgeInsets.all(6),
            itemCount: favoriteBox.length,
            itemBuilder: (context, index) {
              final favorite = favoriteBox.getAt(index);
              return Card(
                elevation: 3,
                child: ListTile(
                  leading: Image.asset(favorite!.productImage),
                  title: Text(favorite.productTitle),
                  subtitle: Text('\$ ${favorite.productPrice.toString()}'),
                  trailing: IconButton(
                    onPressed: () {
                      favoriteBox.deleteAt(index);
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
