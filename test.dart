import 'dart:io';

main(List<String> args) {
  //File file = new File('myfile');
  Directory directory = new Directory('.');
  directory.list().forEach((e) {
    print(e);
  });

}