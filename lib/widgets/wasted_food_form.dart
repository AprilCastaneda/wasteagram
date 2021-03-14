// {
//   void initState() {}

//   @override
//   Widget build(BuildContext context){}

//   Widget itemQuantityField() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: TextFormField(
//           textAlign: TextAlign.center,
//           keyboardType: TextInputType.number,
//           decoration: InputDecoration(
//               hintText: Translations(Localizations.localeOf(context))
//                   .quantityFieldHint),
//           style: Theme.of(context).textTheme.display1,
//           validator: validateItemQuantity,
//           onSaved: saveITemQuantity),
//     );
//   }

//   String validateItemQuantity(String value) {}

//   void saveItemQuantity(String value) {}

//   Widget uploadButton() {}

//   void validateSaveUploadAndPop() {}
// }

// class Translations {
//   Locale locale;
//   Translations({this.locale});

//   final labels = {
//     'en': {
//       'quantityFieldHint': "number of Wasted Items"
//     },
//     'tlh': {
//       'quantityFieldHInt': 'ARGGHBARGH'
//     }
//   };

//   String get quantityFieldHint => labels[locale.languageCode]['quantityFieldHint'];
// }