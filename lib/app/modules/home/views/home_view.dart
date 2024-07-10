import '../../../helper/all_imports.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w(context),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 16.h(context),
                  ),
                  Row(
                    children: [
                      AppText(
                        text: AppStrings.categories,
                        style: h3(
                          context: context,
                          color: AppColors.midnightBlue,
                        ),
                      ),
                      const Spacer(),
                      AppText(
                        text: AppStrings.seeAll,
                        style: bodySMedium(
                          context: context,
                          color: AppColors.grey500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h(context),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (Map tool in controller.tools)
                        InkWell(
                          onTap: () => Get.toNamed(tool["page"]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                tool["image"],
                                width: 62.w(context),
                                height: 62.h(context),
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(
                                height: 4.h(context),
                              ),
                              AppText(
                                text: tool["title"],
                                width: 100.w(context),
                                textAlign: TextAlign.center,
                                maxLines: null,
                                style: bodyXSBold(
                                  context: context,
                                  color: AppColors.grey600,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
