import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool isListView = true;

  final List<Map<String, dynamic>> products = [
    {
      'title': '아이폰 123',
      'price': 200000,
      'originalPrice': 400000,
      'rating': 3.0,
      'image': 'img1.jpg',
    },
    {
      'title': '갤럭시 S123',
      'price': 200000,
      'originalPrice': 400000,
      'rating': 3.5,
      'image': 'img2.jpg',
    },
    {
      'title': '좋은거',
      'price': 200000,
      'originalPrice': 400000,
      'rating': 4.5,
      'image': 'img3.jpg',
    },
    {
      'title': '노트북 1212',
      'price': 200000,
      'originalPrice': 400000,
      'rating': 5.0,
      'image': 'img4.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('쇼핑'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue[800],
            child: Row(
              children: [
                buildTabButton(Icons.view_list, true),
                buildTabButton(Icons.grid_view, false),
              ],
            ),
          ),
          Expanded(
            child: isListView ? buildListView() : buildGridView(),
          ),
        ],
      ),
    );
  }

  Widget buildTabButton(IconData icon, bool listMode) {
    final isSelected = isListView == listMode;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isListView = listMode),
        child: Container(
          color: isSelected ? Colors.blue[800] : Colors.blue[700],
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          leading: Image.asset(product['image'], width: 60, height: 60, fit: BoxFit.cover),
          title: Text(product['title']),
          subtitle: Row(
            children: [
              Text(
                '${product['price']}원',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const SizedBox(width: 8),
              Text(
                '(${product['originalPrice']}원)',
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          trailing: const Icon(Icons.chevron_right),
          isThreeLine: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          subtitleTextStyle: const TextStyle(fontSize: 14),
          dense: true,
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            AspectRatio(
            aspectRatio: 1 / 1,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product['image'],
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text(
                          '${product['price']}원',
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '(${product['originalPrice']}원)',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text('${product['rating'].toStringAsFixed(1)}/5.0',
                              style: const TextStyle(fontSize: 12)),
                        ),
                        const SizedBox(width: 6),
                        Row(
                          children: List.generate(5, (i) {
                            final rating = product['rating'];
                            IconData icon;
                            if (rating >= i + 1) {
                              icon = Icons.star;
                            } else if (rating >= i + 0.5) {
                              icon = Icons.star_half;
                            } else {
                              icon = Icons.star_border;
                            }
                            return Icon(icon, size: 16, color: Colors.amber);
                          }),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
