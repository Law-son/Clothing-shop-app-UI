import 'package:flutter/material.dart';

@immutable
class Category {
  final String img;
  final String imgName;

  const Category({required this.img, required this.imgName});
}

const Categories = [
  Category(img: 'assets/images/cat1.png', imgName: 'Hoodies'),
  Category(img: 'assets/images/cat2.png', imgName: 'Shoes'),
  Category(img: 'assets/images/cat3.png', imgName: 'Bag'),
  Category(img: 'assets/images/cat4.png', imgName: 'Hats'),
  Category(img: 'assets/images/cat5.png', imgName: 'Boxers'),
  Category(img: 'assets/images/cat6.png', imgName: 'Boots'),
];

@immutable
class Product {
  final String img;
  final String name;
  final double price;
  final double cancelledPrice;
  bool liked;

  Product(
      {required this.img,
      required this.name,
      required this.price,
      required this.cancelledPrice,
      required this.liked});
}


 List<Product> products = [
  Product(
      img: 'assets/images/product1.png',
      name: 'PITTI Block - Jacket',
      price: 112.99,
      liked: false,
      cancelledPrice: 139.55),
  Product(
      img: 'assets/images/product2.png',
      name: 'BEPPA Summer - Jacket',
      price: 102.99,
      liked: false,
      cancelledPrice: 129.55),
  Product(
      img: 'assets/images/product3.png',
      name: 'Tokyo Jacket',
      price: 132.99,
      liked: false,
      cancelledPrice: 159.55),
  Product(
      img: 'assets/images/product4.png',
      name: 'MUMBAI Sleeves',
      price: 110.99,
      liked: false,
      cancelledPrice: 159.55),
  Product(
      img: 'assets/images/product5.png',
      name: 'PARIS Jeans - Wear',
      price: 113.99,
      liked: false,
      cancelledPrice: 159.55),
  Product(
      img: 'assets/images/product6.png',
      name: 'BLACK Top - Jeans',
      price: 102.99,
      liked: false,
      cancelledPrice: 133.55),
  Product(
      img: 'assets/images/product7.png',
      name: 'PORTO Ladies - Dress',
      price: 111.99,
      liked: false,
      cancelledPrice: 131.55),
  Product(
      img: 'assets/images/product8.png',
      name: 'SIRI Top - Jacket',
      price: 122.99,
      liked: false,
      cancelledPrice: 136.55),
];
