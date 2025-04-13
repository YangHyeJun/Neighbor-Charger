import 'package:flutter/material.dart';
import '../theme.dart';

class ButtonContainer extends StatelessWidget {
  final AppTextTheme theme = AppTextTheme.instance;
  final String title;
  final Image? image;
  final VoidCallback onPressed;

  ButtonContainer({
    super.key,
    required this.title,
    required this.onPressed,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: theme.blackSubTitle,
              ),
            ),
            if (image != null)
              Align(
                alignment: Alignment.bottomRight,
                child: image!,
              )
          ],
        ),
      ),
    );
  }
}

class ButtonFullContainer extends StatelessWidget {
  final AppTextTheme theme = AppTextTheme.instance;
  final String? title;
  final String? content;
  final Image? image;
  final VoidCallback onPressed;

  ButtonFullContainer({
    super.key,
    this.title,
    required this.onPressed,
    this.image,
    this.content,
  });

  String _getTruncatedContent(String content) {
    const maxLength = 21;

    if (content.length > maxLength) {
      content = content.substring(0, maxLength);
      content = '$content...';
    }

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Expanded(
          child: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title != null) ...[
                          Text(
                            title!,
                            style: theme.blackSubTitle,
                          ),
                        ],
                        if (content != null) ...[
                          Text(
                            _getTruncatedContent(content!),
                            style: theme.body,
                          ),
                        ]
                      ],
                    ),
                  ),
                ],
              ),
              if (image != null)
                Align(
                  alignment: Alignment.bottomRight,
                  child: image!,
                )
            ],
          ),
        ),
      ),
    );
  }
}
