//
//  ViewController.swift
//  ApplicationBackgroundSetting
//
//  Created by jopootrivatel on 23.09.2022.
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
        
        setupAllSliders()
    }
    
    // MARK: IBActions
    @IBAction func redSliderAction() {
        setupAllSliders()
    }
    
    @IBAction func greenSliderAction() {
        setupAllSliders()
    }
    
    @IBAction func blueSliderAction() {
        setupAllSliders()
    }
    
    // MARK: Private Methonds
    private func setupAllSliders() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        backgroundView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value), alpha: CGFloat.infinity)
    }
}

