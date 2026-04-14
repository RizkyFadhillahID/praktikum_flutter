void main() {
  var record = ('first', a: 2, b: true, 'last');

  (int, int) tukar((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  print(record);

  (String, int) mahasiswa = ('Andi', 20);
  print(mahasiswa);

  var mahasiswa2 = ('first', a: 2, b: true, 'last');

  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b);
  print(mahasiswa2.$2);
}
