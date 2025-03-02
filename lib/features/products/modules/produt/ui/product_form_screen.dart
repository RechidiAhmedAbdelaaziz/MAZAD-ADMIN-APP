import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mazad_app/core/constants/static_data.dart';
import 'package:mazad_app/core/extension/localization.extension.dart';
import 'package:mazad_app/core/extension/navigator.extension.dart';
import 'package:mazad_app/core/extension/snackbar.extension.dart';
import 'package:mazad_app/core/extension/validator.extension.dart';
import 'package:mazad_app/core/shared/classes/dimensions.dart';
import 'package:mazad_app/core/shared/widgets/drop_down_menu.dart';
import 'package:mazad_app/core/shared/widgets/images_field.dart';
import 'package:mazad_app/core/shared/widgets/number_form_field.dart';
import 'package:mazad_app/core/shared/widgets/submit_button.dart';
import 'package:mazad_app/core/shared/widgets/text_form_field.dart';
import 'package:mazad_app/features/products/modules/produt/logic/product_cubit.dart';

class ProductFormScreen extends StatelessWidget {
  const ProductFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCubit, ProductState>(
      listener: (context, state) {
        state.onError(context.showErrorSnackbar);

        state.onSave(context.back);
      },
      child:
          !context.select(
                (ProductCubit cubit) => cubit.state.isLoaded,
              )
              ? Center(child: CircularProgressIndicator())
              : Builder(
                builder: (context) {
                  final dto = context.read<ProductCubit>().state.dto;
                  return Scaffold(
                    appBar: AppBar(
                      title: Text('Product'.tr(context)),
                    ),
                    body: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ImagesField(
                              controller: dto.imagesController,
                              height: 509.h,
                              width: 408.w,
                              borderRadius: 33.r,
                            ),
                            heightSpace(16),

                            AppTextFormField(
                              controller: dto.nameController,
                              title: 'ProductName'.tr(context),
                              validator:
                                  (value) =>
                                      value.isEmpty
                                          ? 'RequiredField'.tr(
                                            context,
                                          )
                                          : null,
                            ),
                            heightSpace(16),

                            AppTextFormField(
                              controller: dto.descriptionController,
                              title: 'ProductDescription'.tr(context),
                              keyboardType: TextInputType.multiline,
                              validator:
                                  (value) =>
                                      value.isEmpty
                                          ? 'RequiredField'.tr(
                                            context,
                                          )
                                          : null,
                            ),
                            heightSpace(16),

                            KDropDownMenu(
                              items: StaticData.categories,
                              controller: dto.categoryController,
                              title: 'Category'.tr(context),
                              validator:
                                  (value) =>
                                      value.isEmpty
                                          ? 'RequiredField'.tr(
                                            context,
                                          )
                                          : null,
                            ),
                            heightSpace(16),

                            AppTextFormField(
                              controller: dto.priceController,
                              title: 'ProductPrice'.tr(context),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly,
                              ],
                              validator:
                                  (value) =>
                                      value.isEmpty
                                          ? 'RequiredField'.tr(
                                            context,
                                          )
                                          : value.isNumeric
                                          ? null
                                          : 'InvalidNumber'.tr(
                                            context,
                                          ),
                            ),
                            heightSpace(16),

                            AppTextFormField(
                              controller: dto.stockController,
                              title: 'ProductQuantity'.tr(context),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly,
                              ],
                              validator:
                                  (value) =>
                                      value.isEmpty
                                          ? 'RequiredField'.tr(
                                            context,
                                          )
                                          : value.isNumeric
                                          ? null
                                          : 'InvalidNumber'.tr(
                                            context,
                                          ),
                            ),
                            heightSpace(16),

                            ValuesFormField(
                              controller:
                                  dto.suggestedPricesController,
                              title: 'SuggestedPrices'.tr(context),
                              maxLength: 40,
                            ),
                            heightSpace(25),

                            Builder(
                              builder: (context) {
                                return SubmitButton(
                                  title: 'Save'.tr(context),
                                  onTap:
                                      context
                                          .read<ProductCubit>()
                                          .save,
                                  isLoading: context.select(
                                    (ProductCubit cubit) =>
                                        cubit.state.isLoading,
                                  ),
                                );
                              },
                            ),
                            heightSpace(12),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
