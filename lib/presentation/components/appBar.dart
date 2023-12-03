import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.onTap, this.isExistLeading});
  final void Function()? onTap;
  final bool? isExistLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "my note",
        style: TextStyle(color: Colors.white),
      ),
      leading: isExistLeading == null
          ? InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            )
          : null,
      automaticallyImplyLeading: isExistLeading ?? true,
      backgroundColor: Colors.purple.withOpacity(0.4),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
