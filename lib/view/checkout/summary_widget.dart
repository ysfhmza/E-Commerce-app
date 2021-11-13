import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/view/constants.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          children: [
            SizedBox(
              height: 200.0.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SizedBox(
                  height: 200,
                  width: 150,
                  child: Column(
                    children: [
                      Image.network(
                        controller.cartProductsList[index].image,
                        fit: BoxFit.fill,
                        height: 120.0.h,
                        width: 150.0.w,
                      ),
                      SizedBox(height: 10.0.h),
                      CustomText(
                        text: controller.cartProductsList[index].name,
                        fontSize: 14.0.sp,
                        textOverflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 10.0.h),
                      CustomText(
                        text: "\$ ${controller.cartProductsList[index].price}",
                        fontSize: 14.0.sp,
                        textOverflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        color: primaryColor,
                      )
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 10.0.w),
                itemCount: controller.cartProductsList.length,
              ),
            )
          ],
        ),
      );
    });
  }
}
