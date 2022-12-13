import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()
    var rightAnswerNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        
        quizBrain.nextQuestion()
        //print(rightAnswer, chooseAnswer!)
        if userGotItRight {
            rightAnswerNumber += 1
        }
        UIView.animate(withDuration: 0.2) {
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() ) {
            UIView.animate(withDuration: 0.2) {
                if userGotItRight {
                    sender.backgroundColor = UIColor.green
                    self.updateUI()
                } else {
                    sender.backgroundColor = UIColor.red
                    self.updateUI()
                }
            } //UIView
        }
        
    }
    
    
    @objc func updateUI(){
        //print(rightAnswerNumber, quiz.count)
        progressBar.progress = quizBrain.getProgress(rightAnswerNumber) //Float(rightAnswerNumber)/Float(quiz.count)
        questionLabel.text = quizBrain.getQuestion() //quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

