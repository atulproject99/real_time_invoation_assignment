import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';
import '../extensions/size_extension.dart';

class TextRobo24W700 extends StatelessWidget {
  const TextRobo24W700(
    this.text, {
    super.key,
    this.textAlign,
    this.color,
  });
  final String text;
  final TextAlign? textAlign;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: context.textTheme.headlineMedium!.copyWith(color: color),
    );
  }
}

class TextRobo32W400 extends StatelessWidget {
  const TextRobo32W400(
    this.text, {
    super.key,
    this.textAlign,
    this.color,
  });
  final String text;
  final TextAlign? textAlign;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: context.textTheme.headlineSmall!
          .copyWith(color: color, fontSize: 32.sp),
    );
  }
}

class TextRobo24W400 extends StatelessWidget {
  const TextRobo24W400(
    this.text, {
    super.key,
    this.textAlign,
    this.color,
  });
  final String text;
  final TextAlign? textAlign;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: context.textTheme.headlineSmall!.copyWith(color: color),
    );
  }
}

class TextRobo22W400 extends StatelessWidget {
  const TextRobo22W400(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.color,
  });
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: context.textTheme.titleLarge!.copyWith(color: color),
    );
  }
}

class TextRobo18W500 extends StatelessWidget {
  const TextRobo18W500(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.color,
  });
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: context.textTheme.headlineLarge!.copyWith(color: color),
    );
  }
}

class TextRobo16W500 extends StatelessWidget {
  const TextRobo16W500(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.color,
  });
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: context.textTheme.titleMedium!.copyWith(color: color),
    );
  }
}

class TextRobo16W700 extends StatelessWidget {
  const TextRobo16W700(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.color,
  });
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: context.textTheme.headlineMedium!.copyWith(color: color),
    );
  }
}

class TextRobo16W400 extends StatelessWidget {
  const TextRobo16W400(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.color,
  });
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: context.textTheme.bodyLarge!.copyWith(color: color),
    );
  }
}

class TextRobo14W700 extends StatelessWidget {
  const TextRobo14W700(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
  });
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.labelLarge!.copyWith(color: color),
    );
  }
}

class TextRobo14W500 extends StatelessWidget {
  const TextRobo14W500(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
  });
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: context.textTheme.titleSmall!.copyWith(color: color),
    );
  }
}

class TextRobo14W400 extends StatelessWidget {
  const TextRobo14W400(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
  });
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: context.textTheme.bodyMedium!.copyWith(color: color),
    );
  }
}

class TextRobo12W500 extends StatelessWidget {
  const TextRobo12W500(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
  });
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.labelMedium!.copyWith(color: color),
    );
  }
}

class TextRobo12W400 extends StatelessWidget {
  const TextRobo12W400(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
  });
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.bodySmall!.copyWith(color: color),
    );
  }
}

class TextRobo11W500 extends StatelessWidget {
  const TextRobo11W500(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
  });
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: context.textTheme.labelSmall!.copyWith(color: color),
    );
  }
}
