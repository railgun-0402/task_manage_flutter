import 'package:form_field_validator/form_field_validator.dart';

// 編集画面：編集内容のバリデーション
final editValidator = MultiValidator([
  // 必須チェック
  RequiredValidator(errorText: "編集内容を入力してください"),
  MaxLengthValidator(50, errorText: "編集内容は50文字以内で入力してください")
]);