//: [Previous](@previous)
/*:
 ## Protocols
 Protocols are a defined contract or blueprint that a class, struct or enum must follow.
 */
/*:
 Here we define a 'ShapeProtocol' where anything that conforms to it must provide a property of number of sides and a function called 'shapeDescription'
 */
protocol ShapeProtocol {
    var numberOfSides: Int { get set }
    var color: String { get set }
    func shapeDescription()
    func area(numberOfSides:Int) -> Double
    init(withColor:String)
}

/*:
 This 'Square' class conforms to the 'ShapeProtocol' and defines the number of sides for this shape and it has the shapeDescription method inside.
 */
class Square: ShapeProtocol {
  var color: String
  
  required init(withColor: String) {
    self.color = withColor
    self.numberOfSides = 4
    
  }
  
  
    var numberOfSides: Int
    
    init(){
        self.numberOfSides = 4
      self.color = "blue"
    }
    
    func shapeDescription() {
        
        print("This is a square")
    }
  
  func area(numberOfSides:Int) -> Double {
    return Double(numberOfSides * numberOfSides)
  }
}

/*:
 - Experiment:
 Add a new function in our 'ShapeProtocol' that should calculate the area of its shape. Make sure you implement it in our 'Square' class as well.
 */

/*:
 - Experiment:
 Add a new property in our 'ShapeProtocol' of type String that indicates the colour of this shape.
 */

/*:
 - Experiment:
 We can also declare a custom initializer within our 'ShapeProtocol' that any class must have present. Create an initializer that takes in a colour as a parameter.
 */

/*:
 - Callout(Challenge):
 Define a person protocol with name, gender, age and add a custom initializer to set all the properties and a function to print a description of this person. Create a 'Student' class that conforms to this protocol and print the description of this student using its name.
 */

/*:
 ## Extensions
 Extensions are a way to add additional functions to an existing class, struct or enum.
 \
 For example, I can extend the `'Double'` class to add a function I may use very often such as squaring a number. ie: 4*4 = 16
 
 - Note:
 Extensions are like categories from Objective-C. Unlike Objective-C categories, Swift extensions do not have names.
 */

// This is declaring an extension on the Double class
extension Double {
    
    // This 'square' function takes its own value and multiples it by itself, then returns the new value
    func square() -> Double {
        
        return self * self
    }
}

var myDoubleValue = 5.0
var mySquaredDoubleValue = myDoubleValue.square()

/*:
 - Experiment:
 Try adding the 'square' function to the `Float` type
 */

/*:
 We are going to add a few extensions to several classes that you could potentially use for your future projects to make things more convenient.
 */
/*:
 - Callout(Challenge):
 Create an extension on UIColor that converts hex represented colours to a UIColor to use. ex: #FFFFFF would give a UIColor of white (Hint: You can google the algorithm on how to convert hex values to a UIColor)
 */
import UIKit
extension UIColor {
  func hexToUic(hex: String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
      cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
      return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
  )}
}
/*:
 - Callout(Challenge):
 Create an extension on `String` called 'trim'. This will return a `String` that has the whitespace trimmed from the beginning and end. For example: "    hello there  " will return "hellothere"
 */
extension String {
  func trimWhiteSpacesBeginEnd(word:String) -> String {
    var word2 : String = word
    for _ in 0...word.count {
      if word2.first == " " {
        word2.removeFirst()
      } else if word2.last == " " {
        word2.removeLast()
      }
    }
    return word2
  }
}
var word3 = " kevin tai "
print(word3.trimWhiteSpacesBeginEnd(word: word3))
/*:
 - Callout(Challenge):
 Create an extension on String that checks if an email address has a valid format. You can make the rules as strict or as loose as you'd like. Rules can include verifying there are no spaces, there is a '@' present, etc.
 */
extension String {
  func verifyEmailAddress(email:String) -> String {
    var email2 : String = email
    if email2.contains(" ") {
//      let indexOfSpace = email2.index(of: " ")
//      email2.remove(at: indexOfSpace!)
      email2 = "invalid email due to space"
    } else if email2.contains("@") == false || email2.contains(".") == false {
      email2 = "invalid email due to missing (@) or (.) character"
    }
//    for _ in 0...email.count {
//       {
//        break
//      } else {
//        email2 = "invalid email"
//      }
//    }
    return email2
  }
}
var email3 = "hi@hello.com"
email3.verifyEmailAddress(email: email3)
/*:
 - Callout(Challenge):
 Create an extension on `Double` to add a function that converts the number of seconds into minutes and another function to hours. ex: Given 900 seconds, the minutes returned will be 15 minutes, and the hours returned would be 0.25 hours.
 */
extension Double {
  func calculateMinsHours(fromSeconds: Double) -> String {
    let mins = fromSeconds / 60
    let hours = fromSeconds / 60 / 60
    return "mins \(String(mins)) hours \(String(hours))"
  }
}
var dblVal : Double = 900.0
print(dblVal.calculateMinsHours(fromSeconds: dblVal))
//: [Next](@next)
