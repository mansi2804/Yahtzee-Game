CS 442 MP3: Yahtzee
Overview
This project is a single-player implementation of the classic dice game Yahtzee as part of CS 442 coursework. The game allows the player to roll dice, hold dice, and select scoring categories over multiple rounds, eventually calculating a final score after all 13 categories are filled.

This project uses Flutter to build a dynamic, interactive user interface and demonstrates the use of stateful widgets and state management techniques. The design is tailored for a 720p (1280x720 pixels) screen resolution.

Features:

Dice Rolling: Roll up to five dice at a time.
Hold Dice: Toggle holding dice to exclude them from subsequent rolls.
Scoring: Select from 13 different Yahtzee scoring categories.
Three Rolls Per Turn: The player can roll the dice up to three times per turn before selecting a score.
Game End and Reset: The game ends once all categories have been filled, displaying the final score in an AlertDialog and allowing the player to restart the game.


Project Structure:

Directories and Files
lib/views/: Contains the UI components for the dice display, scorecard display, and the main game container.
lib/models/: Contains the data model classes for dice and scorecard, and the logic to handle dice rolls, score calculations, and game state.

Key Files:

main.dart: Entry point of the application.
yahtzee.dart: Core UI for the game, including the main game container, dice display, and scorecard UI. It ties together the different components of the app and manages the layout.
dice.dart: Handles the dice mechanics (rolling, holding, etc.).
scorecard.dart: Manages the scorecard logic, including scoring calculations and tracking which categories have been used.

How to Run the Project:

Prerequisites

Install Flutter.

Clone this repository: git clone <repository-url>

Running the App

Navigate to the project directory: cd yahtzee-game

Run the app in a simulator or a connected device: flutter run


State Management
This project uses the Provider package for state management. The Dice and Scorecard classes encapsulate the game state, allowing the UI to react to changes in the dice rolls, held status, and score categories.

Testing and Platforms

This app has been tested on the following platforms:

iOS
Web (Chrome)

