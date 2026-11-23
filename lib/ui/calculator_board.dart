import 'package:calculator/core/theme/app_colors.dart';
import 'package:calculator/ui/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorBoard extends StatefulWidget {
  const CalculatorBoard({super.key});

  @override
  State<CalculatorBoard> createState()  => _CalculatorBoard();
}

class _CalculatorBoard extends State<CalculatorBoard> {
  String _result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        _result,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        _previewResult,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white.withAlpha(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                // Ac clear
                                CalculatorButton(
                                  butText: "Ac",
                                  btnColor: AppColors.lightGrey,
                                  btnTextColor: AppColors.white,
                                  onTap: _onClear,
                                  
                                ),
                                // back_space
                                CalculatorButton(
                                  btnColor: AppColors.lightGrey,
                                  btnTextColor: AppColors.white,
                                  onTap: _onBackSpace,
                                ),
                                // /
                                CalculatorButton(
                                  butText: "/",
                                  btnColor: AppColors.darkBlue,
                                  btnTextColor: AppColors.white,
                                  onTap: _onButtonClicked,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                CalculatorButton(
                                  butText: "7",
                                  onTap: _onButtonClicked,
                                ),
                                CalculatorButton(
                                  butText: "8",
                                  onTap: _onButtonClicked,
                                ),
                                CalculatorButton(
                                  butText: "9",
                                  onTap: _onButtonClicked,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                CalculatorButton(
                                  butText: "4",
                                  onTap: _onButtonClicked,
                                ),
                                CalculatorButton(
                                  butText: "5",
                                  onTap: _onButtonClicked,
                                ),
                                CalculatorButton(
                                  butText: "6",
                                  onTap: _onButtonClicked,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                CalculatorButton(
                                  butText: "1",
                                  onTap: _onButtonClicked,
                                ),
                                CalculatorButton(
                                  butText: "2",
                                  onTap: _onButtonClicked,
                                ),
                                CalculatorButton(
                                  butText: "3",
                                  onTap: _onButtonClicked,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                CalculatorButton(
                                  butFlex: 2,
                                  butText: "0",
                                  onTap: _onButtonClicked,
                                ),
                                CalculatorButton(
                                  butText: ".",
                                  onTap: _onButtonClicked,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          // *
                          CalculatorButton(
                            butFlex: 2,
                            butText: "*",
                            btnColor: AppColors.darkBlue,
                            btnTextColor: AppColors.white,
                            onTap: _onOperatorClicked,
                          ),
                          // -
                          CalculatorButton(
                            butFlex: 2,
                            butText: "-",
                            btnColor: AppColors.darkBlue,
                            btnTextColor: AppColors.white,
                            onTap: _onOperatorClicked,
                          ),
                          // +
                          CalculatorButton(
                            butFlex: 3,
                            butText: "+",
                            btnColor: AppColors.darkBlue,
                            btnTextColor: AppColors.white,
                            onTap: _onOperatorClicked,
                          ),
                          // equal =
                          CalculatorButton(
                            butFlex: 3,
                            butText: "=",
                            btnColor: AppColors.lightBlue,
                            btnTextColor: AppColors.white,
                            onTap: _onEqualClicked,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _savedNumber = "";
  String _secondNumber = "";
  String _savedOperator = "";
  String _previewResult = "";


  void _onButtonClicked(String buttonText) {
    if(buttonText == "." && _result.contains(".")) return;
    setState(() {
      _result += buttonText;
      if (_savedOperator.isNotEmpty) {
        _secondNumber += buttonText;

        if (_secondNumber.isNotEmpty) {
          _previewResult = _calculate(
            _savedNumber,
            _savedOperator,
            _secondNumber,
          );
        }
      }
    });
  }
  void _onOperatorClicked(String buttonText){
    if(_result.isEmpty)return;
    if (["+", "-", "*", "/"].contains(_result[_result.length - 1])) {
      setState(() {
        _result = _result.substring(0, _result.length - 1) + buttonText;
        _savedOperator = buttonText;
        _previewResult = "";
      });
      return;
    }
    if(_savedOperator.isEmpty){
      _savedNumber = _result;
      _savedOperator = buttonText;
    }else{
      _savedNumber = _previewResult;
      _savedOperator = buttonText;
    }
    _secondNumber = "";
    setState(() {
      _previewResult = "";
      _result += buttonText;
    });
  }
  void _onEqualClicked(String buttonText){
    if(_previewResult.isEmpty) return;
    setState(() {
     _result = _previewResult;
     _previewResult = "";
     _savedNumber = "";
     _secondNumber = "";
     _savedOperator = "";
    });
  }
  void _onClear(String buttonText){
    setState(() {
      _result = "";
      _savedNumber = "";
      _savedOperator = "";
      _secondNumber = "";
      _previewResult = "";
    });
  }
  void _onBackSpace(String buttonText) {
    if (_result.isEmpty) return;

    setState(() {
      _result = _result.substring(0, _result.length - 1);

      // نحدد آخر Operator موجود في التعبير
      int lastOperatorIndex = _result.lastIndexOf(RegExp(r'[+\-*/]'));

      // لو التعبير انتهى بـ Operator
      if (_result.isEmpty ||
          ['+', '-', '*', '/'].contains(_result[_result.length - 1])) {
        _previewResult = "";
        _secondNumber = "";

        if (lastOperatorIndex == -1) {
          _savedNumber = "";
          _savedOperator = "";
        } else {
          _savedNumber = _result.substring(0, lastOperatorIndex);
          _savedOperator = _result[lastOperatorIndex];
        }
      } else {
        // لو التعبير انتهى برقم
        if (lastOperatorIndex == -1) {
          _previewResult = "";
          _savedNumber = "";
          _savedOperator = "";
          _secondNumber = "";
        } else {
          _savedNumber = _result.substring(0, lastOperatorIndex);
          _savedOperator = _result[lastOperatorIndex];
          _secondNumber = _result.substring(lastOperatorIndex + 1);

          if (_secondNumber.isNotEmpty) {
            _previewResult = _calculate(
              _savedNumber,
              _savedOperator,
              _secondNumber,
            );
          } else {
            _previewResult = "";
          }
        }
      }
    });
  }
  String _calculate( String savedNumber, String savedOperator, String secondNumber) {
  double res = 0 ;
  double? lhs = double.tryParse(savedNumber);
  double? rhs = double.tryParse(secondNumber);

  if (lhs == null || rhs == null) {
    _showErrorSnackBar("Invalid number");
    return "Error";
  }

  switch(savedOperator){
    case "+":
      res = lhs + rhs;
      break;
    case "-":
      res = lhs - rhs;
      break;
    case"*":
      res = lhs * rhs;
      break;
    case"/":
      if (rhs == 0) {
        _showErrorSnackBar("Cannot divide by zero");
        return "";
      } else {
        res = lhs / rhs;
      }
      break;
  }
  return res % 1 ==0 ? res.toInt().toString() : res.toString();
}
  void _showErrorSnackBar(String messageError){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(messageError),
          backgroundColor: AppColors.grey,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        )
    );
}

}




