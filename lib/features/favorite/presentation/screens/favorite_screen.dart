import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../manager/favorite_cubit.dart';
import '../widgets/favorite_product_card.dart';
import '../../data/models/favorite_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoriteCubit>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('المفضلة'),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
      ),
      body: BlocBuilder<FavoriteCubit, List<FavoriteProductData>>(
        builder: (context, favoriteProducts) {
          if (favoriteProducts.isEmpty) {
            return Center(
              child: Text(
                "لا توجد عناصر مفضلة بعد",
                style: AppFonts.font18GreenBold,
              ),
            );
          }

          return ListView.builder(
            itemCount: favoriteProducts.length,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 10.r, bottom: 20.r),
            itemBuilder: (context, index) {
              final product = favoriteProducts[index];
              return FavoriteProductCard(product: product);
            },
          );
        },
      ),
    );
  }
}
