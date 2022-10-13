//
//  ViewController.swift
//  ApplicationBackgroundSetting
//
//  Created by Nikita Chekan on 23.09.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
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
    
    // MARK: - Public Properties
    var delegate: SettingsViewControllerDelegate!
    var color: UIColor!
    
    // MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = color
        changeColor()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
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
}

// MARK: Private Methonds
extension SettingsViewController {
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okeyAction = UIAlertAction(title: "OK", style: .default) {_ in
            textField?.text = "1.00"
            textField?.becomeFirstResponder()
        }
        
        alert.addAction(okeyAction)
        present(alert, animated: true)
    }
    
    func changeBackgroundColor() {
        color = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        backgroundView.backgroundColor = color
    }
    
    private func changeColor() {
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

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        guard let currentValue = Float(text), (0...1).contains(currentValue) else {
            showAlert(
                title: "Fatal error!",
                message: "Please, enter correct value (0 - 1)",
                textField: textField
            )
            return
        }
        
        switch textField {
        case redTextField:
            redSlider.setValue(Float(text) ?? redSlider.value, animated: true)
        case greenTextField:
            greenSlider.setValue(Float(text) ?? greenSlider.value, animated: true)
        default:
            blueSlider.setValue(Float(text) ?? blueSlider.value, animated: true)
        }
        changeBackgroundColor()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolBar = UIToolbar()
        keyboardToolBar.sizeToFit()
        
        textField.inputAccessoryView = keyboardToolBar

        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )

        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )

        keyboardToolBar.items = [flexBarButton, doneButton]
    }
}
