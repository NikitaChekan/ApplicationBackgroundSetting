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
    
    var color: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.cornerRadius = 20
    
        transmitAndFormatValuesInLabel()
        setTheRGBforView()
    }
    
    // MARK: IBActions
    @IBAction func slidersAction(_ sender: UISlider) {
        setTheRGBforView()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonTapped() {
        changeBackgroundColor()
        //passedValueFromColor()
        delegate.setNewValue(for: color)
        dismiss(animated: true)
    }
    
    // MARK: Private Methonds
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func transmitAndFormatValuesInLabel() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    private func setTheRGBforView() {
//        backgroundView.backgroundColor = UIColor(
//            red: CGFloat(redSlider.value),
//            green: CGFloat(greenSlider.value),
//            blue: CGFloat(blueSlider.value),
//            alpha: 1
//        )
        changeBackgroundColor()
    }
}

// MARK: - UIColorDelegate
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
    
//    func passedValueFromColor() {
//        let color = CIColor(color: color)
//
//        redSlider.value = Float(color.red)
//        greenSlider.value = Float(color.green)
//        blueSlider.value = Float(color.blue)
//    }
}
