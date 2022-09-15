//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Max Klimakhovich on 29/06/2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }
    


    
    
    // MARK: Init
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Instances
    var responses: [Answer]
    
    // MARK: Methods
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in counts[answer.type, default: 0] += 1
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted{ $0.1 > $1.1 }.first!.key
    
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    

}
