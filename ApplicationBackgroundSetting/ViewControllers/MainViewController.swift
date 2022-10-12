//
//  MainViewController.swift
//  ApplicationBackgroundSetting
//
//  Created by Nikita Chekan on 11.10.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValue(for color: UIColor)
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
    }

}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setNewValue(for color: UIColor) {
        view.backgroundColor = color
    }
}
