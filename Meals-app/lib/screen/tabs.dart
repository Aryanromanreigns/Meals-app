import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/categories.dart';
import 'package:meals_app/screen/filters.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';
// import 'package:flutter_practice/Meals%20App/data/dummy.dart';
// import 'package:flutter_practice/Meals%20App/models/meal.dart';
// import 'package:flutter_practice/Meals%20App/screen/categories.dart';
// import 'package:flutter_practice/Meals%20App/screen/filters.dart';
// import 'package:flutter_practice/Meals%20App/screen/meals.dart';
// import 'package:flutter_practice/Meals%20App/widgets/main_drawer.dart';

const kinitialfilters = {
  Filter.gltenfree: false,
  Filter.lactosefree: false,
  Filter.vegetrain: false,
  Filter.vegan: false
};

class Tabsscreen extends StatefulWidget {
  const Tabsscreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _Tabsscreenstate();
  }
}

class _Tabsscreenstate extends State<Tabsscreen> {
  int _selectedpageindex = 0;
  final List<Meal> _favoratemeals = [];
  Map<Filter, bool> _selectdefilters = kinitialfilters;

  void _shoeinfomessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _togglemealsfavoruteStatus(Meal meal) {
    final isexisting = _favoratemeals.contains(meal);
    if (isexisting) {
      setState(() {
        _favoratemeals.remove(meal);
      });
      _shoeinfomessage('meal is no longer a favourite');
    } else {
      setState(() {
        _favoratemeals.add(meal);
      });
      _shoeinfomessage('Marked as favourite');
    }
  }

  void _selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  void _setscreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => Filterscreen(
                    currentfilters: _selectdefilters,
                  )));
      setState(() {
        _selectdefilters = result ?? kinitialfilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availablemeals = dummyMeals.where((meal) {
      if (_selectdefilters[Filter.gltenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectdefilters[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectdefilters[Filter.vegetrain]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectdefilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activepage = CategoriesScreen(
      ontogglefavorute: _togglemealsfavoruteStatus,
      avialablemeals: availablemeals,
    );
    var acttivepagetitle = 'Categories';
    if (_selectedpageindex == 1) {
      activepage = MealsScreen(
        title: 'Favorte',
        meals: _favoratemeals,
        ontogglefavorute: _togglemealsfavoruteStatus,
      );
      acttivepagetitle = 'your Favourate ';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(acttivepagetitle),
      ),
      drawer: Maindrawer(
        onselectedscreen: _setscreen,
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: _selectedpageindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite')
        ],
      ),
    );
  }
}
