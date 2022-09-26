//
//  ViewController.swift
//  ApplicationBackgroundSetting
//
//  Created by Nikita Chekan on 23.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
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
        case redSlider, greenSlider:
            transmitAndFormatValuesInLabel()
        default:
            transmitAndFormatValuesInLabel()
        }
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
        backgroundView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}

