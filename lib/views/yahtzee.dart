import '/models/dice.dart';
import '/models/scorecard.dart';
import 'package:flutter/material.dart';
class Yahtzee extends StatefulWidget {
  const Yahtzee({Key? key}) : super(key: key);
       
  @override
  _YahtzeeState createState() => _YahtzeeState();
}

class _YahtzeeState extends State<Yahtzee> {
  Dice _dice = Dice(5);
  ScoreCard _scoreCard = ScoreCard();
  int _remainingRolls = 3;
  int _categoriesRemaining = 13;
  List<bool> _categorySelected = List.generate(
    ScoreCategory.values.length,
    (index) => false,
  );

  final List<ScoreCategory> _scoreCategories = ScoreCategory.values.toList();

  void _resetGame() {
    setState(() {
      _dice = Dice(5);
      _scoreCard = ScoreCard();
      _remainingRolls = 3;
      _categoriesRemaining = 13;
      _categorySelected = List.generate(
        ScoreCategory.values.length,
        (index) => false,
      );
    });
  }

  void _rollDice() {
    if (_remainingRolls > 0) {
      setState(() {
        _dice.roll();
        _remainingRolls--;
      });
    }
  }

  void _showGameOverDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            title: const Row(
              children: [
                Icon(Icons.star_rate, color: Colors.blueAccent),
                SizedBox(width: 10),
                Text('Game Over!'),
              ],
            ),
            content: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  const TextSpan(text: 'You scored a '),
                  TextSpan(
                      text: '${_scoreCard.total}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.teal)),
                  const TextSpan(text: ' points.\n\nReady for another round?'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.teal, 
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child:
                      Text('PLAY AGAIN', style: TextStyle(color: Colors.white)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  _resetGame();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectCategory(ScoreCategory category) {
    if (_remainingRolls < 3 &&
        _remainingRolls >= 0 &&
        _categoriesRemaining > 0) {
      setState(() {
        _scoreCard.registerScore(category, _dice.values);
        _remainingRolls = 3;
        _dice.clear();
        _categorySelected[category.index] = true;
        _categoriesRemaining--;
      });
      if (_categoriesRemaining == 0) {
        _showGameOverDialog(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yahtzee Game'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Adding vertical space before the dice display
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  5, (index) => _DiceDisplay(dice: _dice, index: index)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _rollDice,
              child: Text('Remaining Rolls: $_remainingRolls'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
          
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  childAspectRatio: 2, 
                  mainAxisSpacing: 8.0, 
                  crossAxisSpacing: 8.0, 
                ),
                itemCount: _scoreCategories.length,
                itemBuilder: (context, index) {
                  final category = _scoreCategories[index];
                  return _buildCategoryColumn(category);
                },
              ),
            ),
            _buildScoreDisplay(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryColumn(ScoreCategory category) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            category.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14.0,
                color: Color.fromARGB(255, 0, 60, 120)), 
          ),
        ),
        GestureDetector(
          onTap: () {
            _selectCategory(category);
          },
          child: _categorySelected[category.index]
              ? Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${_scoreCard.getScore(category) ?? ''}',
                    style: const TextStyle(
                        fontSize: 12, color: Colors.teal), 
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    _selectCategory(category);
                  },
                  child: const Text('Select'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.teal, 
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildScoreDisplay() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 25, 115, 117), 
            Color.fromARGB(255, 24, 113, 133)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(128, 0, 0, 0),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Text(
          "Current Score: ${_scoreCard.total}",
          key: ValueKey<int>(_scoreCard.total),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Color.fromARGB(128, 0, 0, 0),
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DiceDisplay extends StatefulWidget {
  final Dice dice;
  final int index;

  const _DiceDisplay({Key? key, required this.dice, required this.index})
      : super(key: key);

  @override
  _DiceDisplayState createState() => _DiceDisplayState();
}

class _DiceDisplayState extends State<_DiceDisplay> {
  @override
  Widget build(BuildContext context) {
    final isHeld = widget.dice.isHeld(widget.index);
    final diceValue = widget.dice[widget.index];
    final color = isHeld
        ? const Color.fromARGB(255, 208, 239, 250)
        : const Color.fromARGB(255, 173, 226, 243);
    final shadow = isHeld
        ? BoxShadow(
            color: const Color.fromARGB(255, 66, 70, 73).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 4),
          )
        : const BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          );

    return GestureDetector(
      onTap: () {
        setState(() {
          widget.dice.toggleHold(widget.index);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [shadow],
        ),
        alignment: Alignment.center,
        width: 50,
        height: 50,
        child: Text(
          '$diceValue',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
