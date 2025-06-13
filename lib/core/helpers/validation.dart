class MaeRValidator {

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'E-mail girilmesi zorunlu!';
    }

    final emailRegExp = RegExp(r'[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Geçersiz E-mail adresi';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre girilmesi zorunlu!';
    }

    if (value.length < 6) {
      return 'Şifre 6 karakterden uzun olmalıdır!';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Şifre en az bir adet büyük harf içermelidir!';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Şifre en az bir adet rakam içermelidir!';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Şifre en az bir adet küçük harf içermelidir!';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefon girilmesi zorunlu!';
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Geçersiz telefon formatı! (10 karakter girilmelidir.)';
    }

    return null;
  }
}
