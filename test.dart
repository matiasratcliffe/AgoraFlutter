main() {
   dynamic isNumeric(String string) {
    try {
      int.parse(string);
      return true;
    } catch(e) {return false;}
  }
  print(isNumeric('-d9'));
}