import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sales/product_model.dart';
import 'package:flutter_sales/review_model.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatelessWidget {
  final Product product;
  const ReviewPage(this.product,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Review> review;
    
    int random = Random().nextInt(5);
    return Scaffold(
      appBar: AppBar(title: Text("Avis sur ${product.title}")),
      body: Center(
          child: Row(
        children: [
          const Icon(Icons.star_outlined),
          const Icon(Icons.star_outlined),
          const Icon(Icons.star_outlined),
          const Icon(Icons.star_half),
          Spacer(),
          // Pouvoir générer des belles étoiles avec une lib
          Image.network(product.image, width: 80,height: 80,),
          const Text("Avis :"),
          const Text("Mon avis sur cet objet est celui là : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae auctor eu augue ut. Amet aliquam id diam maecenas ultricies mi."),
          // Pouvoir faire un listView sur une liste d'avis (pas eu le temps de faire)
          // ListView.builder
    ],
      ),)
    );
  }
}
typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({this.starCount = 5, this.rating = .0, required this.onRatingChanged, required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}
