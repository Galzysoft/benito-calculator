import 'package:baniito_calculator/screens/calculator/widget/calc_btn.dart';
import 'package:baniito_calculator/utils/utils.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController screenTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String name = "ada";
    print(name.substring(1, 2));
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backBlack,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              buildScreen(),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: AppTheme.originalBlack),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Align(
                        child: Container(
                            height: 10,
                            width: 50,
                            decoration: AppDecorations.rouded
                                .copyWith(color: AppTheme.btnRed)),
                      ),
                      SizedBox(height: 20),
                      buildButtons(),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildScreen() {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      padding: EdgeInsets.all(8),
      alignment: Alignment.bottomRight,
      decoration: AppDecorations.outline,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: screenTextController,
            showCursor: true,
            autofocus: true,
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "0",
              hintStyle: AppTextStyles.screenStyle,
            ),
            style: AppTextStyles.screenStyle,
            keyboardType: TextInputType.none,
          ),
        ],
      ),
    ));
  }

  Widget buildButtons() {
    return Expanded(
        child: Container(
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcBtn(
                    onPressed: () {
                      screenTextController.clear();
                    },
                    text: "C"),
                CalcBtn(
                    onPressed: () {
                      enterText(number: "/");
                    },
                    text: "/"),
                CalcBtn(
                    onPressed: () {
                      enterText(number: "X");
                    },
                    text: "X"),
                CalcBtn(
                    onPressed: () {
                      deleteText();
                    },
                    text: "DEL"),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcBtn(
                    onPressed: () {
                      enterText(number: "7");
                    },
                    text: "7"),
                CalcBtn(
                    onPressed: () {
                      enterText(number: "8");
                    },
                    text: "8"),
                CalcBtn(
                    onPressed: () {
                      enterText(number: "9");
                    },
                    text: "9"),
                CalcBtn(onPressed: () {}, text: "-"),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcBtn(
                    onPressed: () {
                      enterText(number: "4");
                    },
                    text: "4"),
                CalcBtn(
                    onPressed: () {
                      enterText(number: "5");
                    },
                    text: "5"),
                CalcBtn(
                    onPressed: () {
                      enterText(number: "6");
                    },
                    text: "6"),
                CalcBtn(
                    onPressed: () {
                      enterText(number: "+");
                    },
                    text: "+"),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcBtn(
                    onPressed: () {
                      enterText(number: "1");
                    },
                    text: "1"),
                CalcBtn(
                    onPressed: () {
                      enterText(number: "2");
                    },
                    text: "2"),
                CalcBtn(
                    onPressed: () {
                      enterText(number: "3");
                    },
                    text: "3"),
                CalcBtn(onPressed: () {}, text: "="),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcBtn(
                    onPressed: () {
                      enterText(number: "%");
                    },
                    text: "%"),
                CalcBtn(
                    onPressed: () {
                      enterText(number: "0");
                    },
                    text: "0"),
                CalcBtn(
                    onPressed: () {
                      enterText(number: ".");
                    },
                    text: "."),
                CalcBtn(onPressed: () {}, text: "Ans"),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void enterText({required String number}) {
    TextSelection cusorSelection = screenTextController.selection;
    int cusorbasePosition = cusorSelection.baseOffset;

    screenTextController.value = screenTextController.value
        .replaced(TextRange.collapsed(cusorbasePosition), number);
    // setState(() {});
  }

  void deleteText() {
    TextSelection cusorSelection = screenTextController.selection;

    /// lets check  if the user selected multiple text or not
    if (cusorSelection.baseOffset == cusorSelection.extentOffset) {
      ///the user did not  select multiple text
      String newText =
          screenTextController.text.substring(0, cusorSelection.baseOffset - 1);
      String newText2 =
          screenTextController.text.substring(cusorSelection.baseOffset);

      print(newText);
      print(newText2);
      print(newText + newText2);
      screenTextController.text = newText + newText2;

      screenTextController.selection = TextSelection.collapsed(
        offset: cusorSelection.baseOffset - 1,
      );
    } else {
      ///the user   selected multiple text
      String newText=   screenTextController.text.replaceRange(cusorSelection.baseOffset, cusorSelection.extentOffset, "");
      screenTextController.text=newText;
      screenTextController.selection = TextSelection.collapsed(
        offset: cusorSelection.baseOffset - 1,
      );
    }
  }
}
