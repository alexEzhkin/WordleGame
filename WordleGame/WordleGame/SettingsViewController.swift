//
//  SettingsViewController.swift
//  WordleGame
//
//  Created by Alex on 15.05.22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var vibrationSwitch: UISwitch!
    
    @IBOutlet weak var languagePicker: UIPickerView!
    
    let data = ["US", "RUS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        languagePicker.dataSource = self
        languagePicker.delegate = self
        
        soundSwitch.isOn = UserDefaults.standard.bool(forKey: "Sound Setting")
        vibrationSwitch.isOn = UserDefaults.standard.bool(forKey: "Vibration Setting")
        
        soundSwitch.addTarget(self, action: #selector(soundSwitchChanged), for: UIControl.Event.valueChanged)
        vibrationSwitch.addTarget(self, action: #selector(vibrationSwitchChanged), for: UIControl.Event.valueChanged)
    }
    
    @objc func soundSwitchChanged(soundSwitch: UISwitch) {
        if soundSwitch.isOn {
            UserDefaults.standard.set(soundSwitch.isOn, forKey: "Sound Setting")
        } else {
            UserDefaults.standard.set(soundSwitch.isOn, forKey: "Sound Setting")
        }
    }
    
    @objc func vibrationSwitchChanged(vibrationSwtich: UISwitch) {
        if vibrationSwtich.isOn {
            UserDefaults.standard.set(vibrationSwtich.isOn, forKey: "Vibration Setting")
        } else {
            UserDefaults.standard.set(vibrationSwtich.isOn, forKey: "Vibration Setting")
        }
    }
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(data[row])
    }
}
