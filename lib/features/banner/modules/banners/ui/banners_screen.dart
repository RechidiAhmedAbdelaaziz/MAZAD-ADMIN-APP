import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mazad_app/core/extension/localization.extension.dart';
import 'package:mazad_app/core/shared/widgets/pagination_builder.dart';
import 'package:mazad_app/features/banner/data/models/banner_model.dart';
import 'package:mazad_app/features/banner/modules/banners/logic/banners_cubit.dart';

class BannersScreen extends StatelessWidget {
  const BannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = context.select(
      (BannersCubit cubit) => cubit.state.banners,
    );
    return Scaffold(
      appBar: AppBar(title: Text('Banners'.tr(context))),
      body: PaginationBuilder(
        items: banners,
        itemBuilder: (banner) => _BannerItem(banner),
        isLoading: context.select(
          (BannersCubit cubit) => cubit.state.isLoading,
        ),
        onLoadMore: context.read<BannersCubit>().getBanners,
        separator: const Divider(),
      ),
    );
  }
}

class _BannerItem extends StatelessWidget {
  final BannerModel banner;

  const _BannerItem(this.banner);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(banner.title ?? ''),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(banner.region ?? ''),
                    ],
                  ),
                ],
              ),
            ),
            PopupMenuButton(itemBuilder: _optionsBuiler),
          ],
        ),
        Container(
          height: 200.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image: DecorationImage(
              image: NetworkImage(banner.imageUrl ?? ''),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  List<PopupMenuEntry> _optionsBuiler(BuildContext context) {
    return [
      PopupMenuItem(
        onTap: () {
          //TODO go to edit banner screen and update the banner
        },
        child: Text('Edit'.tr(context)),
      ),
      PopupMenuItem(
        onTap:
            () => context.read<BannersCubit>().removeBanner(banner),
        child: Text('Delete'.tr(context)),
      ),
    ];
  }
}
