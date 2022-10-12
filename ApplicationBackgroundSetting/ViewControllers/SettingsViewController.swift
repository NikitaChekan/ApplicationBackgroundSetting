//
//  ViewController.swift
//  ApplicationBackgroundSetting
//
//  Created by Nikita Chekan on 23.09.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var color: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = color
    
        transferTheColorBack()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: IBActions
    @IBAction func slidersAction(_ sender: UISlider) {
        changeBackgroundColor()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonTapped() {
        delegate.setNewValue(for: color)
        dismiss(animated: true)
    }
    
    // MARK: Private Methonds
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}

// MARK: - Color Delegate
extension SettingsViewController {
    func changeBackgroundColor() {
        color = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        backgroundView.backgroundColor = color
    }
    
    private func transferTheColorBack() {
        let color = CIColor(color: color)
        
        redSlider.value = Float(color.red)
        greenSlider.value = Float(color.green)
        blueSlider.value = Float(color.blue)
        
        redLabel.text = (String(format: "%.2f", color.red))
        greenLabel.text = (String(format: "%.2f", color.green))
        blueLabel.text = (String(format: "%.2f", color.blue))
        
        redTextField.text = (String(format: "%.2f", color.red))
        greenTextField.text = (String(format: "%.2f", color.green))
        blueTextField.text = (String(format: "%.2f", color.blue))
        
    }
}
