import 'package:albums/screens/home/card_view.dart';
import 'package:albums/utils/ui/type_faced_text.dart';
import 'package:albums/utils/ui/ui_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumsItemView extends StatelessWidget {
  final String? thumbNailUrl;
  final String? title;
  final double? padding;

  const AlbumsItemView({Key? key, this.thumbNailUrl, this.title, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = padding != null
        ? MediaQuery.of(context).size.width - padding!
        : MediaQuery.of(context).size.width - 20;
    return SizedBox(
      width: cardWidth / 2,
      child: CustomCardView(
        cardPadding: padding ?? 20,
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: 90,
                  imageUrl: thumbNailUrl ?? 'na',
                  placeholder: (context, url) => Transform.scale(
                    scale: 0.3,
                    child: const CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                  ),
                ),
              ),
            ),
            UiHelper.verticalSpaceSmall,
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TypeFacedText(
                  color: Colors.white,
                  title: title?.toUpperCase() ?? 'na',
                  textAlign: TextAlign.center,
                  textSize: 12.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
