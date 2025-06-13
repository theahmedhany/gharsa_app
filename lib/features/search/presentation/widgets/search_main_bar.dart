import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';

class SearchMainBar extends StatefulWidget {
  final Function(String) onSearchChanged;
  final VoidCallback onClearSearch;

  const SearchMainBar({
    super.key,
    required this.onSearchChanged,
    required this.onClearSearch,
  });

  @override
  State<SearchMainBar> createState() => _SearchMainBarState();
}

class _SearchMainBarState extends State<SearchMainBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    widget.onClearSearch();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onChanged: widget.onSearchChanged,
      style: TextStyle(color: Colors.black, fontSize: 14.sp),
      cursorColor: AppColors.kMainPrimaryColor,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 26,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.kMainGreyColor, width: 1.5.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.kMainPrimaryColor,
            width: 1.5.r,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.kMainGreyColor, width: 1.5.r),
        ),
        hintStyle: TextStyle(color: AppColors.kMainGreyColor, fontSize: 16.sp),
        hintText: 'ابحث عن منتج',
        filled: true,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 8.r),
          child: const Icon(Icons.search, color: AppColors.kMainGreyColor),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 45.r,
          minHeight: 20.r,
          maxHeight: 20.r,
          maxWidth: 45.r,
        ),
        fillColor: Colors.white,
        suffixIcon:
            _searchController.text.isNotEmpty
                ? IconButton(
                  padding: EdgeInsets.only(right: 14.r),
                  icon: Icon(size: 20.r, Icons.clear, color: Colors.black87),
                  onPressed: _clearSearch,
                )
                : null,
      ),
    );
  }
}
