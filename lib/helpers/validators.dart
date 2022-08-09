bool emailValid(String email) {
  final RegExp regex = RegExp(
// EXPRESSAO REGULAR - UM CONJUNTO DE REGRAS PARA VALIDAR UM TEXTO
    r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$",
  );
  return regex.hasMatch(email);
}
