import 'package:bilibili/themes/colors.dart';
import 'package:flutter/material.dart';

/// `@diff` 教程中的 `flutter` 版本为 `1.x`, 本项目使用 `2.x`, 之后不再提示
///
/// 并且启用了 `null safety`(`sdk: '>=2.12.0 <3.0.0'`), 所以每个参数都考虑其是否可选,
/// 避免空指针导致的异常
class LoginInput extends StatefulWidget {
  final String title;
  final String hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? focusChange;

  /// `@diff` 增加了最大输入限制
  int? maxLength = 16;

  /// 底部边框是否拉伸
  bool lineStreth = false;

  /// 是否隐藏输入内容
  bool obscureText = false;

  /// 键盘输入类型
  TextInputType keboardType = TextInputType.text;

  LoginInput({
    Key? key,
    required this.title,
    required this.hint,
    this.onChanged,
    this.focusChange,
    this.maxLength = 16,
    this.lineStreth = false,
    this.obscureText = false,
    this.keboardType = TextInputType.text,
  }) : super(key: key);

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    /// `@diff` 教程中直接监听了 `focus event`, 但因为 `focusChange` 是 `final`
    /// 所以应该先判断是否传入了 `focusChange`, 避免无意义的监听
    if (widget.focusChange != null) {
      _focusNode.addListener(() {
        widget.focusChange!(_focusNode.hasFocus);
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              _input(),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: widget.lineStreth ? 0 : 15,
              right: widget.lineStreth ? 0 : 15,
            ),
            child: Divider(
              height: 1,
              thickness: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _input() => Expanded(
        child: TextField(
          focusNode: _focusNode,
          onChanged: widget.onChanged,
          obscureText: widget.obscureText,
          keyboardType: widget.keboardType,
          autofocus: !widget.obscureText,
          cursorColor: AppColors.primary,
          maxLength: widget.maxLength,
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20, right: 20),
              border: InputBorder.none,
              hintText: widget.hint,

              /// `@diff` 将 counter 置空则不显示 counter
              counterText: '',
              hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
        ),
      );
}
