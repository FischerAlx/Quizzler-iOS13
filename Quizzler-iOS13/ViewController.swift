import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    let quiz = [
        ["Two plus Four is equal to Six", "True"],
        ["Four minus Two is greater than One", "True"],
        ["Five plus One is less then Three", "False"],
    ]
    
    var questionNumber = 0
    var rightAnswerNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let chooseAnswer = sender.currentTitle
        let rightAnswer = quiz[questionNumber][1]
        
        if questionNumber + 1 < quiz.count{
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        //print(rightAnswer, chooseAnswer!)
        if rightAnswer == chooseAnswer {
            rightAnswerNumber += 1
        }
        updateUI()
    }
    

    func updateUI(){
        //print(rightAnswerNumber, quiz.count)
        progressBar.progress = Float(rightAnswerNumber)/Float(quiz.count)
        questionLabel.text = quiz[questionNumber][0]
    }
    
}

