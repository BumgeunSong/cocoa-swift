//
//  TestViewController.swift
//  Sprep_2
//
//  Created by Bumgeun Song on 2021/12/01.
//

import UIKit

class TestViewController: UIViewController {
    
    var tester: Tester?
    var testQueue: [Card]?
    var currentIndex: Int = 0

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var difficultyButton: [UIButton]!
    @IBOutlet weak var answerButton: UIButton!
    
    @IBOutlet weak var timeSpentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testQueue = tester?.getTestQueue()
        presentNextQuestion()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        if self.testQueue == nil { return }
        presentNextAnswer()
        toggleButtonEnabled()
    }
    
    @IBAction func difficultyPressed(_ sender: UIButton) {
        guard let testQueue = testQueue else {
            return
        }
        if currentIndex >= testQueue.count {
            questionLabel.text = "모든 질문이 끝났습니다!"
            answerLabel.text = ""
            timeSpentLabel.text = ""
        } else {
            updateResult(sender: sender)
            presentNextQuestion()
            toggleButtonEnabled()
            
        }
    }
    
    func updateResult(sender: UIButton) {
        var difficulty = DifficultyOption.unknown
        if sender.tag == 1 {
            difficulty = .easy
        } else if sender.tag == 2 {
            difficulty = .medium
        } else if sender.tag == 3 {
            difficulty = .hard
        }
        tester?.updateTestResult(card: testQueue![currentIndex], difficulty: difficulty)
    }
    
    
    func presentNextQuestion() {
        guard let testQueue = self.testQueue else {
            questionLabel.text = "공부해야할 질문이 없습니다!"
            return
        }
        
        questionLabel.text = testQueue[currentIndex].front
        answerLabel.text = ""
        startWatch()
        
    }
    
    func presentNextAnswer() {
        if let currentCard = self.testQueue?[currentIndex] {
            answerLabel.text = currentCard.back
            currentIndex += 1
            stopWatch()
        }
    }
    
    func startWatch() {
        tester?.startWatch()
        timeSpentLabel.text = ""
    }
    
    func stopWatch() {
        tester?.stopWatch()
        timeSpentLabel.text = String(format: "%.1f초 소요", tester!.getTimeSpent())
    }
    
    func toggleButtonEnabled() {
        answerButton.isEnabled = !answerButton.isEnabled
        for button in difficultyButton {
            button.isEnabled = !button.isEnabled
        }
    }
}
