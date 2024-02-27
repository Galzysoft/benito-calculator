import 'package:baniito_calculator/utils/utils.dart';

class CalcBtn extends StatelessWidget {
  const CalcBtn({super.key, required this.onPressed, required this.text});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.outline
          .copyWith(borderRadius: BorderRadius.circular(20),),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: AppTextStyles.btnStyle,
          )),
    );
  }
}
