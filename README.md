
<div align="center"> <h1> Yahtzee Game </h1> </div>

<div> <h1> Overview </h1> </div>
</br>This project is a single-player implementation of the classic dice game Yahtzee, developed as part of the CS 442 coursework. The game allows the player to roll dice, hold dice, and select scoring categories over multiple rounds, ultimately calculating a final score after all 13 categories are filled. </br>
The app is built using Flutter to provide a dynamic, interactive user interface, demonstrating state management and the use of stateful widgets. The design is tailored for 720p resolution (1280x720 pixels).

<div align="center"> <h1> Features </h1> </div>
🎲 Dice Rolling: Roll up to five dice at a time.</br>
🎯 Hold Dice: Toggle holding dice to exclude them from subsequent rolls.</br>
📝 Scoring: Select from 13 different Yahtzee scoring categories.</br>
🔄 Three Rolls Per Turn: Roll the dice up to three times before selecting a score.</br>
🎉 Game End and Reset: After filling all categories, the game ends and the final score is shown in an AlertDialog, allowing the player to restart the game.</br>

<div align="center"> <h1> Project Structure </h1> </div>

Directories and Files</br>
lib/views/: Contains the UI components, including the dice display, scorecard display, and the main game container.</br>
lib/models/: Contains the data model classes for dice and scorecard, as well as logic for dice rolls, score calculations, and overall game state.</br>

<div align="center"> <h1> Key Files </h1> </div>
main.dart: Entry point of the application.</br>
yahtzee.dart: Core UI for the game, including the main game container, dice display, and scorecard UI. It ties together various components and manages the layout.</br>
dice.dart: Handles dice mechanics such as rolling and holding.</br>
scorecard.dart: Manages scorecard logic, scoring calculations, and category tracking.</br>

<div align="center"> <h1> How to Run the Project </h1> </div>

Prerequisites:</br>
Install Flutter

Clone the Repository: </br>
git clone <repository-url> 

Running the App</br>

Navigate to the project directory:</br>
cd yahtzee-game

Fetch the project dependencies:</br>
flutter pub get

Run the app in a simulator or on a connected device:</br>
flutter run

<div align="center"> <h1> State Management </h1> </div>
This project utilizes the Provider package for state management. The Dice and Scorecard classes encapsulate the game state, allowing the UI to dynamically react to changes in dice rolls, hold status, and score categories.

<div align="center"> <h1> Testing and Platforms </h1> </div>

This app has been tested on the following platforms: </br>
iOS </br>
Web (Chrome) </br>


<div align="center"> <h1>Thank you for checking out this project! 😊  </h1> </div>
