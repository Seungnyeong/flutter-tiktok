import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/features/users/view_models/avatar_view_model.dart';

class Avatar extends ConsumerWidget {
  final String name;
  final bool hasAvatar;
  final String uid;
  const Avatar(
      {super.key,
      required this.name,
      required this.hasAvatar,
      required this.uid});

  Future<void> _onAvartarTap(WidgetRef ref) async {
    final xfile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
      maxHeight: 150,
      maxWidth: 150,
    );
    if (xfile != null) {
      final file = File(xfile.path);
      ref.read(avatarProvider.notifier).uploadAvatar(file);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(avatarProvider).isLoading;
    return GestureDetector(
      onTap: isLoading ? null : () => _onAvartarTap(ref),
      child: isLoading
          ? Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const CircularProgressIndicator(),
            )
          : CircleAvatar(
              radius: 50,
              foregroundColor: Colors.blue,
              foregroundImage: hasAvatar
                  ? NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/sn-tictok-clone.appspot.com/o/avatars%2F$uid?alt=media&haha=${DateTime.now().toString()}")
                  : null,
              child: Text(name),
            ),
    );
  }
}
