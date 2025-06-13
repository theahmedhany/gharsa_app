import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/favorite/data/models/favorite_model.dart';
import '../../features/favorite/manager/favorite_cubit.dart';

class CustomFavoriteButton extends StatelessWidget {
  final int itemId;
  final String name;
  final double price;
  final String imageUrl;
  final String category;

  const CustomFavoriteButton({
    super.key,
    required this.itemId,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, List<FavoriteProductData>>(
      builder: (context, favoriteItems) {
        final isFavorite = favoriteItems.any(
          (favProduct) => favProduct.productId == itemId,
        );

        return GestureDetector(
          onTap: () {
            final product = FavoriteProductData(
              productId: itemId,
              name: name,
              price: price,
              pictureUrl: imageUrl,
              categoryName: category,
            );
            context.read<FavoriteCubit>().toggleFavorite(product);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Center(
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
                size: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
