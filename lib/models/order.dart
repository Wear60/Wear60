import 'package:flutter/material.dart';

class Order {
  final String image;
  final String status;
  final Color statusColor;
  final String description;

  const Order({
    required this.image,
    required this.status,
    required this.statusColor,
    required this.description,
  });
}