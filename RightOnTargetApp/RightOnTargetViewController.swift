//
//  ViewController.swift
//  RightOnTargetApp
//
//  Created by OSIIOSdev on 13.03.2025.
//

import UIKit

final class RightOnTargetViewController: UIViewController {

    // MARK: - Private properties
    
    private let desiredValueLabel = UILabel()
    private let minimumValuelabel = UILabel()
    private let maximumValueLabel = UILabel()
    
    private let sliderStackView = UIStackView()
    
    private let desiredValueSlider = UISlider()
    private let checkValueButton = UIButton()
    
    
    var game: Game!
    
    private let missingValueText = "The value is still missing"
    
    
    // MARK: - View Lyfecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        game = Game(minValue: 1, maxValue: 10, rounds: 5, bound: 10)
        updateLabelWithDesiredValue(textLabel: (game.currentDesiredValue).formatted())
        
        getValueLabel()
        getSliderStackView()
        getCheckedButton()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(false)
        
        showAlertController(title: "New game", message: "Try to get less than \(game.limit) points. To start a game press \"Start game\"")
        
    }
    
    
    // MARK: - Private methods
    
    private func updateLabelWithDesiredValue(textLabel: String) {
        desiredValueLabel.text = textLabel
    }
    
    private func getSliderStackView() {
        
        view.addSubview(sliderStackView)
        sliderStackView.translatesAutoresizingMaskIntoConstraints = false
        
        getValueSlider()
        
        [minimumValuelabel, desiredValueSlider, maximumValueLabel].forEach {
            sliderStackView.addArrangedSubview($0)
        }
        
        sliderStackView.distribution = .fill
        sliderStackView.alignment = .fill
        sliderStackView.spacing = 15
        
        sliderStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        sliderStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    private func getValueLabel() {
        
        desiredValueLabel.text = missingValueText
        
        [minimumValuelabel, desiredValueLabel, maximumValueLabel].forEach {
            view.addSubview($0)
            
            $0.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            $0.font = UIFont.boldSystemFont(ofSize: 22)
        }
        
        desiredValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            desiredValueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            desiredValueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        ])
        
        minimumValuelabel.text = game.minDesiredValue.formatted()
        maximumValueLabel.text = game.maxDesiredValue.formatted()
        
    }
    
    private func getValueSlider() {
        
        desiredValueSlider.minimumValue = Float(game.minDesiredValue)
        desiredValueSlider.maximumValue = Float(game.maxDesiredValue)
        desiredValueSlider.value = Float.random(in: desiredValueSlider.minimumValue...desiredValueSlider.maximumValue)
        
        desiredValueSlider.minimumTrackTintColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        desiredValueSlider.maximumTrackTintColor = .white
        desiredValueSlider.thumbTintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        
        view.addSubview(desiredValueSlider)
        desiredValueSlider.translatesAutoresizingMaskIntoConstraints = false
        
        desiredValueSlider.widthAnchor.constraint(equalToConstant: 550).isActive = true
        
    }
    
    private func getCheckedButton() {
        
        checkValueButton.layer.cornerRadius = 15
        checkValueButton.layer.borderWidth = 2.5
        checkValueButton.layer.borderColor = UIColor.black.cgColor
        checkValueButton.backgroundColor = .white
        checkValueButton.setTitleColor(.black, for: .normal)
        checkValueButton.setTitle("Start game", for: .normal)
        checkValueButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        
        view.addSubview(checkValueButton)
        checkValueButton.addTarget(self, action: #selector(getResultButton), for: .touchUpInside)
        checkValueButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkValueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkValueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            checkValueButton.widthAnchor.constraint(equalToConstant: 175),
            checkValueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc func getResultButton() {
        
        if checkValueButton.currentTitle == "Start game" {
            checkValueButton.setTitle("Check value", for: .normal)
        }
        
        game.calculateScore(with: Int(desiredValueSlider.value))
        
        if game.isGameOver {
            game.score <= game.limit ? showAlertController(title: "Game over", message: "You win! Your final result is \(game.score)") :
            showAlertController(title: "Game over", message: "You lose! Your final result is \(game.score)")
            
            game.resdartGame()
            
            desiredValueLabel.text = 0.formatted()
            checkValueButton.setTitle("Start game", for: .normal)
            desiredValueLabel.text = missingValueText
            
            return
        } else {
            game.startNewRound()
        }
        
        updateLabelWithDesiredValue(textLabel: (game.currentDesiredValue).formatted())
        
    }
    
    private func showAlertController(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
        
    }

}

