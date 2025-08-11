import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Filter {
  gltenfree,
  lactosefree,
  vegetrain,
  vegan,
}

class Filterscreen extends StatefulWidget {
  const Filterscreen({super.key, required this.currentfilters});
  // Added constructor with key
  final Map<Filter, bool> currentfilters;

  @override
  State<StatefulWidget> createState() {
    return _FilterscreenState();
  }
}

class _FilterscreenState extends State<Filterscreen> {
  var _gluteenfree = false;
  var _lactosefree = false;
  var _vegertainfree = false;
  var _veganfree = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gluteenfree = widget.currentfilters[Filter.gltenfree]!;
    _lactosefree = widget.currentfilters[Filter.lactosefree]!;
    _vegertainfree = widget.currentfilters[Filter.vegetrain]!;
    _veganfree = widget.currentfilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      // drawer: Maindrawer(onselectedscreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier == 'Meals'){
      //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Tabsscreen()));
      //   }
      // }),

      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gltenfree: _gluteenfree,
            Filter.lactosefree: _lactosefree,
            Filter.vegetrain: _vegertainfree,
            Filter.vegan: _veganfree
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluteenfree,
              onChanged: (isChecked) {
                setState(() {
                  _gluteenfree = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactosefree,
              onChanged: (isChecked) {
                setState(() {
                  _lactosefree = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegertainfree,
              onChanged: (isChecked) {
                setState(() {
                  _vegertainfree = isChecked;
                });
              },
              title: Text(
                'Vegertrain-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegetrain-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganfree,
              onChanged: (isChecked) {
                setState(() {
                  _veganfree = isChecked;
                });
              },
              title: Text(
                'Vagan-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
