# PlanetsApp
 -  This is an app that lists all the planets using [ PLANETS API](https://swapi.dev/api/planets/)

### How to Clone / Open the app

- Goto github link [Planets APP](https://github.com/keshgurung/PlanetsApp)
- Open terminal, select a place to clone the project eg: cd desktop
- Use command ``` git clone https://github.com/keshgurung/PlanetsApp ``` to clone the project locally.
- Open the project, CLick on the PlanetsApp.xcodeproj file. The file will open in XCode.
- Goto product menu and select run or simply click on the play button to run the app in simulator.
- To run tests, goto product menu and click on test. All the tests will run on the simulator.

### XCode
- Version: 14.2
- Minimum Deployment: iOS 15.0 and over

### Architecture and design pattern:
- The app follows Repository Clean Architecture, with dependency injection pattern, singleton design pattern (coredata). 
- All the unit test cases are written using XCTest framework (native iOS).
- Mock and stub technique is used writing the unit test cases in the app to test the network service as well as the view model tests.

### Offline View:
- The app can be viewed offline when there is no network/ wifi. The data is saved in the Core Data (iOS persistance framework) which will be used to show the items when there is no network coverage.

### Localisation and identifier
- The app is localised in french language too. The .string file is present in the app for base language(english) and french.
- Accesibility identifiers are added for the list items in the app to make easy for UI testing.

### Screenshots (with localised and base language)

- Main screen (english)
![en-list](./screenshots/en-list.png)


- Main screen (french)
![fr-list](./screenshots/fr-list.png)
