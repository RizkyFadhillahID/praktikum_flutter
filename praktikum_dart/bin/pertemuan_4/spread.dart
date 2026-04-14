void main() {
  var list1 = [1, 2, 3];
  var list2 = [0, ...list1];

  print(list1);
  print(list2);
  print(list2.length);

  list1 = [1, 2, 9];
  var list3 = [0, ...?list1];
  print(list3);
  print(list3.length);

  var promoActive = false;

  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  var login = 'inventory';

  var nav2 = [
    'Home',
    'Furniture',
    'Plants',
    if (login case 'Manager') 'Inventory',
  ];
  print(nav2);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  var listOfStrings2 = ['#0', ...listOfStrings.map((i) => '#$i')];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
  print(listOfStrings2);
}
