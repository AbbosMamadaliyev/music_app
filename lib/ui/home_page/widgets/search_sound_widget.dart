import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../home_page_model.dart';

class SearchSoundWidget extends StatelessWidget {
  const SearchSoundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();

    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade600.withOpacity(0.7),
      ),
      child: TextField(
        onChanged: model.searchSound,
        focusNode: FocusNode(
          canRequestFocus: false,
          descendantsAreFocusable: false,
          skipTraversal: true,
        ),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
