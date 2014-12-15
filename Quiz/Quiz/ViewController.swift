import UIKit
import Foundation

let questions = [
    "What is your favorite color?",
    "What is your name?",
    "What is the air speed velocity of an African Swallow?"
]

let answers = [
    "Blue",
    "Alex",
    "25mph"
]

class ViewController: UIViewController {
    
    var index: Int = Int(rand() % Int32(questions.count))

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBAction func questionButton(sender: AnyObject) {
        index = Int(rand() % Int32(questions.count))
        questionLabel.text = questions[index]
        answerLabel.text = "Tap \"Show Answer\""
    }

    
    @IBAction func answerButtonPressed(sender: AnyObject) {
        answerLabel.text = answers[index]
    }
    

}

