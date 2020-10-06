import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskFormat {
  static MaskTextInputFormatter phoneMask() {
    return MaskTextInputFormatter(mask: "(##)# ####-####");
  }

  static MaskTextInputFormatter dateMask() {
    return MaskTextInputFormatter(mask: "##/##/####");
  }
}
