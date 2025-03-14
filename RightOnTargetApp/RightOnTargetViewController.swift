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
    private let desiredValueSlider = UISlider()
    private let checkValueButton = UIButton()
    
    private let missingValueText: String = "The value is still missing"
    
    
    // MARK: - View Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        getValueLabel()
        getValueSlider()
        getCheckedButton()
    }
    
    
    // MARK: - Private methods
    
    private func getValueLabel() {
        
        desiredValueLabel.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        desiredValueLabel.font = UIFont.boldSystemFont(ofSize: 22)
        desiredValueLabel.text = missingValueText
        
        view.addSubview(desiredValueLabel)
        desiredValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            desiredValueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            desiredValueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        ])
        
    }
    
    private func getValueSlider() {
        
        desiredValueSlider.minimumValue = 1
        desiredValueSlider.maximumValue = 50
        desiredValueSlider.value = Float.random(in: desiredValueSlider.minimumValue...desiredValueSlider.maximumValue)
        
        desiredValueSlider.minimumTrackTintColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        desiredValueSlider.maximumTrackTintColor = .white
        desiredValueSlider.thumbTintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        desiredValueSlider.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        desiredValueSlider.minimumValueImage = UIImage(systemName: "01.square.fill")
        desiredValueSlider.maximumValueImage = UIImage(systemName: "50.square.fill")
        
        view.addSubview(desiredValueSlider)
        desiredValueSlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            desiredValueSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            desiredValueSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            desiredValueSlider.widthAnchor.constraint(equalToConstant: 550)
        ])
        
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
        checkValueButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkValueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkValueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            checkValueButton.widthAnchor.constraint(equalToConstant: 175),
            checkValueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

