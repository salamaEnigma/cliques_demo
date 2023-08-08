import 'package:cliques_demo/helpers/context.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';

class ImageLoader extends StatelessWidget {
  final String imageUrl;
  final BoxFit imageFit;
  final String? assetImage;
  final bool memoryCache;
  final bool circular; // Whether the image should be circular
  final double borderRadius; // Radius for rounded edges

  const ImageLoader({
    required this.imageUrl,
    this.imageFit = BoxFit.cover,
    this.assetImage,
    Key? key,
    this.memoryCache = true,
    this.circular = false,
    this.borderRadius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (imageUrl.isNotEmpty)
        ? ExtendedImage.network(
            height: double.infinity,
            imageUrl,
            enableMemoryCache: memoryCache,
            colorBlendMode: BlendMode.color,
            fit: BoxFit.cover,
            shape: circular
                ? BoxShape.circle
                : BoxShape.rectangle, // Set shape based on circular value
            border: Border.all(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
            borderRadius: circular ? null : BorderRadius.circular(borderRadius),
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  return Center(
                    child: SizedBox(
                      height: 40,
                      child: LoadingIndicator(
                        colors: [context.colorScheme.primary],
                        indicatorType: Indicator.ballScale,
                      ),
                    ),
                  );

                case LoadState.completed:
                  return state.completedWidget;

                default:
                  return assetImage != null
                      ? Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(assetImage!),
                                fit: BoxFit.cover),
                            shape:
                                circular ? BoxShape.circle : BoxShape.rectangle,
                          ),
                        )
                      : const Placeholder();
              }
            },
          )
        : assetImage != null
            ? Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(assetImage!), fit: BoxFit.cover),
                  shape: circular ? BoxShape.circle : BoxShape.rectangle,
                ),
              )
            : const Placeholder();
  }
}
