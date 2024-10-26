import 'package:api_example3/carts.dart';
import 'package:flutter/material.dart';

class CartDetailPage extends StatelessWidget{
  final Cart carts;
  const CartDetailPage ({required this.carts});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: const Text(
          "Cart Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
         backgroundColor: const Color.fromARGB(255, 136, 10, 52),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: carts.products.length,
          itemBuilder: (context, index) {
            final product = carts.products[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(product.thumbnail),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Name: ${product.title}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Price: \$${product.price}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Quantity: ${product.quantity}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Total: \$${product.total}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Discount Percentage: ${product.discountPercentage}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Discounted Total: \$${product.discountedTotal}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Divider(color: Colors.black),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}