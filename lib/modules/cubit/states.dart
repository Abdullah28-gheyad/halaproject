// = setstate
abstract class AppStates {}

class AppInitialState extends AppStates {}

class AddProductLoadingState extends AppStates {}

class AddProductSuccessState extends AppStates {}

class AddProductErrorState extends AppStates {}

class AppGetProductLoadingState extends AppStates {}

class AppGetProductSuccessState extends AppStates {}

class AppGetProductErrorState extends AppStates {}
