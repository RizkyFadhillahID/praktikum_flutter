import 'dart:io';

void main() {
  // print("masukkan nama:");
  // String? nama = stdin.readLineSync();
  // print("hallo $nama");

  int n1, n2, hasil;

  print("masukkan bilangan pertama:");
  n1 = int.parse(stdin.readLineSync()!);

  print("masukkan bilangan kedua:");
  n2 = int.parse(stdin.readLineSync()!);
  hasil = n1 + n2;

  print("hasil penjumlahan $n1 + $n2 = $hasil");
}
