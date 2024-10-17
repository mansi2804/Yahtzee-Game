
<div align="center"> <h1>CS 442 MP3: Yahtzee</h1> </div>

**Overview: 
This project is a single-player implementation of the classic dice game Yahtzee, developed as part of the CS 442 coursework. The game allows the player to roll dice, hold dice, and select scoring categories over multiple rounds, ultimately calculating a final score after all 13 categories are filled.

The app is built using Flutter to provide a dynamic, interactive user interface, demonstrating state management and the use of stateful widgets. The design is tailored for 720p resolution (1280x720 pixels).

**Features:
🎲 Dice Rolling: Roll up to five dice at a time.
🎯 Hold Dice: Toggle holding dice to exclude them from subsequent rolls.
📝 Scoring: Select from 13 different Yahtzee scoring categories.
🔄 Three Rolls Per Turn: Roll the dice up to three times before selecting a score.
🎉 Game End and Reset: After filling all categories, the game ends and the final score is shown in an AlertDialog, allowing the player to restart the game.

**Project Structure: 

Directories and Files
lib/views/: Contains the UI components, including the dice display, scorecard display, and the main game container.
lib/models/: Contains the data model classes for dice and scorecard, as well as logic for dice rolls, score calculations, and overall game state.

**Key Files
main.dart: Entry point of the application.
yahtzee.dart: Core UI for the game, including the main game container, dice display, and scorecard UI. It ties together various components and manages the layout.
dice.dart: Handles dice mechanics such as rolling and holding.
scorecard.dart: Manages scorecard logic, scoring calculations, and category tracking.

**How to Run the Project

Prerequisites
Install Flutter.

Clone the Repository:
git clone <repository-url> 

Running the App
Navigate to the project directory:
cd yahtzee-game

Run the app in a simulator or on a connected device:
flutter run

**State Management
This project utilizes the Provider package for state management. The Dice and Scorecard classes encapsulate the game state, allowing the UI to dynamically react to changes in dice rolls, hold status, and score categories.

**Testing and Platforms

This app has been tested on the following platforms:
iOS
Web (Chrome)
