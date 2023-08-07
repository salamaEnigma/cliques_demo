import 'package:cliques_demo/helpers/context.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ImageLoader extends StatelessWidget {
  final String imageUrl;

  final BoxFit imageFit;
  // A default image to display from assets when the network image not shown for any reason.
  final String? assetImage;
  final bool memoryCache;

  const ImageLoader(
      {required this.imageUrl,
      this.imageFit = BoxFit.cover,
      this.assetImage,
      Key? key,
      this.memoryCache = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (imageUrl.isNotEmpty)
        ? ExtendedImage.network(
            imageUrl,
            enableMemoryCache: memoryCache,
            colorBlendMode: BlendMode.color,
            fit: imageFit,
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  return Center(
                    child: SizedBox(
                      height: 50,
                      child: LoadingIndicator(
                          colors: [context.colorScheme.primary],
                          indicatorType: Indicator.ballScale),
                    ),
                  );

                case LoadState.completed:
                  return state.completedWidget;

                default:
                  return assetImage != null
                      ? Image.asset(
                          assetImage!,
                          fit: imageFit,
                        )
                      : const Placeholder();
              }
            },
          )
        : assetImage != null
            ? Image.asset(
                assetImage!,
                fit: imageFit,
              )
            : const Placeholder();
  }
}
