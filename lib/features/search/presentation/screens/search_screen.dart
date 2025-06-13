import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/search_products_model.dart';
import '../../manager/search_products_cubit.dart';
import '../../manager/search_products_state.dart';
import '../widgets/search_main_bar.dart';
import '../widgets/search_product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  Timer? _debounce;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        searchQuery.isNotEmpty) {
      context.read<SearchProductsCubit>().getProductsBySearch(
        searchedProduct: searchQuery,
        isInitialLoad: false,
      );
    }
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        searchQuery = query.trim();
      });
      if (searchQuery.isNotEmpty) {
        context.read<SearchProductsCubit>().getProductsBySearch(
          searchedProduct: searchQuery,
        );
      } else {
        context.read<SearchProductsCubit>().resetToInitialState();
      }
    });
  }

  void _onClearSearch() {
    setState(() {
      searchQuery = '';
    });
    context.read<SearchProductsCubit>().resetToInitialState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ابدأ البحث'),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: SearchMainBar(
              onSearchChanged: _onSearchChanged,
              onClearSearch: _onClearSearch,
            ),
          ),
          verticalSpace(30),
          Expanded(
            child:
                searchQuery.isEmpty
                    ? _buildIdleView()
                    : BlocBuilder<
                      SearchProductsCubit,
                      SearchProductsState<SearchProductsModel>
                    >(
                      builder: (context, state) {
                        return state.when(
                          loading:
                              () => const Center(
                                child: CustomProgressIndicator(),
                              ),
                          loadingMore:
                              (products) => Stack(
                                children: [
                                  _buildProductList(products.data?.data ?? []),
                                  const Positioned(
                                    bottom: 20,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: CustomProgressIndicator(),
                                    ),
                                  ),
                                ],
                              ),
                          success: (products) {
                            final productList = products.data?.data ?? [];
                            if (productList.isEmpty) {
                              return Center(
                                child: Text(
                                  'لا توجد منتجات متاحة.',
                                  textDirection: TextDirection.rtl,
                                  style: AppFonts.font18GreenBold,
                                ),
                              );
                            }
                            return _buildProductList(productList);
                          },
                          error:
                              (error) => Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Error: $error',
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                    verticalSpace(16),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (searchQuery.isNotEmpty) {
                                          context
                                              .read<SearchProductsCubit>()
                                              .getProductsBySearch(
                                                searchedProduct: searchQuery,
                                              );
                                        }
                                      },
                                      child: const Text('Retry'),
                                    ),
                                  ],
                                ),
                              ),
                          idle: () => const SizedBox.shrink(),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(List<ProductData> products) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(bottom: 26.r),
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (_, index) {
        final product = products[index];
        return SearchProductCard(
          imageSrc: product.pictureUrl ?? '',
          title: product.name ?? 'Unknown',
          price: product.price ?? 0.0,
          id: product.productId?.toString() ?? '0',
          categoryName: product.categoryName ?? 'Unknown',
          press: () {
            context.pushNamed(
              Routes.detailsScreen,
              arguments: {'productId': product.productId},
            );
          },
        );
      },
    );
  }

  Widget _buildIdleView() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              width: 350.r,
              height: 350.r,
              'assets/icons/start_searching.svg',
            ),
            Text(
              textDirection: TextDirection.rtl,
              'ابدأ البحث عن المنتجات الآن!',
              style: AppFonts.font20DarkSemiBold,
            ),
            verticalSpace(80),
          ],
        ),
      ),
    );
  }
}
