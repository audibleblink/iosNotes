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

class QuizViewController: UIViewController {
    
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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Set the tab bar item's title
        tabBarItem.title = "Quiz"
        // Put an image on the tab bar item
        tabBarItem.image = UIImage(named: "Hypno.png")
    }
    
    convenience override init() {
        self.init(nibName: "QuizViewController", bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}

