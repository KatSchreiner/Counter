//
//  ViewController.swift
//  Counter
//
//  Created by Екатерина Шрайнер on 12.12.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var changeHistory: UITextView!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreLabel.text = "\(counter)"
        changeHistory.text = "История изменений:"
        changeHistory.isScrollEnabled = true
        changeHistory.isEditable = false
    }
    
    @IBAction func sendAction(_ sender: Any) {
        counter += 1
        scoreLabel.text = "Значение счетчика: \(counter)"
    }
    
    @IBAction func plusAction(_ sender: Any) {
        counter += 1
        updateScoreLabel(with: "значение изменено на +1")
    }
    
    @IBAction func minusAction(_ sender: Any) {
            if counter > 0 {
                counter -= 1
                updateScoreLabel(with: "значение изменено на -1")
            } else {
                updateScoreLabel(with: "попытка уменьшить значение счётчика ниже 0")
            }
    }
    
    @IBAction func reserAction(_ sender: Any) {
        counter = 0
        updateScoreLabel(with: "значение сброшено")
    }
    
    func updateScoreLabel(with change: String) {
            scoreLabel.text = "Значение счетчика: \(counter)"
    
            let todayDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .medium
            dateFormatter.locale = Locale(identifier: "ru_RU")

            let history = "\n\(dateFormatter.string(from: todayDate)): \(change)"
            changeHistory.text += history
        }
}

