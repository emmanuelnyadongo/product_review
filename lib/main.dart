import 'package:flutter/material.dart';

void main() {
  runApp(ProductNavigationApp());
}

class ProductNavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListPage(),
    );
  }
}

class Product {
  final String name;
  final String description;
  final int price;
  final int rating;
  final Color color;

  Product(this.name, this.description, this.price, this.rating, this.color);
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product('pixel 1', 'Pixel is the most featureful phone ever', 800, 4, Colors.blue),
    Product('laptop', 'Laptop is most productive development tool', 2000, 5, Colors.green),
    Product('tablet', 'Tablet is the most useful device ever for meeting', 1500, 3, Colors.amber),
    Product('pen drive', 'Pendrive is the stylist phone ever', 100, 4, Colors.red),
    Product('floppy drive', 'Floppy Drive is a vintage storage device', 50, 2, Colors.brown),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Navigation'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                products[index].name,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              tileColor: products[index].color,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(products[index].description, style: TextStyle(color: Colors.white)),
                  SizedBox(height: 5),
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        starIndex < products[index].rating ? Icons.star : Icons.star_border,
                        size: 16,
                        color: Colors.orange,
                      );
                    }),
                  ),
                ],
              ),
              trailing: Text('Price: ${products[index].price}', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: products[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              color: product.color,
              child: Text(
                product.name,
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              product.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Price: ${product.price}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Row(
              children: List.generate(5, (starIndex) {
                return Icon(
                  starIndex < product.rating ? Icons.star : Icons.star_border,
                  size: 24,
                  color: Colors.orange,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
