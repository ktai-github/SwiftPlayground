//: [Previous](@previous)
import Foundation
/*:
 ## More Tuples
 We already know switch statements can evaluate some value and tries to match it up with a case provided.
 The value that switch statements evaluate can also be a tuple!
 The switch statement evaluates each value of the tuple individually and tries to find a match in the provided cases.
 */
/*:
 Imagine we are rolling two six-sided dice. We can use a tuple to represent each of the dice values.
 */
let diceRoll = (4, 4)

// Our switch statement looks for the cases where the total value of the dice rolled is 11
switch diceRoll {
case (5, 6):
  print("We got 11!")
case (6, 5):
  print("We got 11!")
case (_, 1):
  print("We got a 1!")
case (1...3, 1...3):
  print("between 1 and 3")
case (let x, let y) where x == y:
  print("equal")
default:
  print("This roll doesn't matter to us")
}

/*:
 - Experiment:
 Use the below switch statement to test the following cases. What do they do? Try changing the value of `diceRoll` to see what happens!
 - case (_, 1)
 - case (2, _)
 - case (1...3, 1...3)
 - case (let x, let y) where x == y
 */


/*:
 - Callout(Challenge):
 Create a switch statement that prints out which holiday it is given the month and the day to evaluate. Cover the following holidays:
 - Christmas Day - Dec 25
 - New Years Day - Jan 1
 - Valentine's Day - Feb 14
 - Halloween Day - Oct 31
 - Otherwise, indiciate the given day is not a holiday
 */
let holiday = (12, 25)

switch holiday {
case (12, 25):
  print("Christmas Day")
case (1, 1):
  print("New Years Day")
case (2, 14):
  print("Valentine's Day")
case (10, 31):
  print("Halloween Day")
default:
  print("Nothing Special")
}

/*:
 - Callout(Challenge):
 Take a look at the following X-Y Graph.
 
 ![x-y_graph](x-y_graph.png)
 
 Given an X-Y coordinate within a tuple, write a switch statement to cover the following cases and print these descriptions:
 - point is on the x axis
 - point is on the y axis
 - point is inside the blue outlined box
 - point is outside the blue outlined box
 */
let xy = (-1, -2)

switch xy {
case (_, 0):
  print("Y axis")
case (0, _):
  print("X axis")
case (-2...2, -2...2):
  print("point is inside the blue outlined box")
default:
  print("point is outside the blue outlined box")
}


//: [Next](@next)
