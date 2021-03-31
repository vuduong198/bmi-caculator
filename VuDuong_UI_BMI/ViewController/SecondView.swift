//
//  SecondView.swift
//  VuDuong_UI_BMI
//
//  Created by Vũ Dương on 29/03/2021.
//

import UIKit

class SecondView: UIViewController {
    
    var bmiTotal : Float = 0.0
    let topLabel : CustomHighLabel = {
        let label = CustomHighLabel()
        label.text = "Your Result"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    let mainFrame : CustomFrame = {
        return CustomFrame()
    }()
    let resultLabel : CustomLabel = {
        let label = CustomLabel()
        label.text = "NORMAL"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.47, green: 0.78, blue: 0.61, alpha: 1.00)
        return label
    }()
    let resultNumber : CustomHighLabel = {
        let label = CustomHighLabel()
        label.text = "22.22"
        label.font = UIFont.boldSystemFont(ofSize: 55)
        return label
    }()
    let statusLabel1 : CustomLabel = {
        let label = CustomLabel()
        label.text = "You have a normal body weight"
        return label
    }()
    let statusLabel2 : CustomLabel = {
        let label = CustomLabel()
        label.numberOfLines = 2
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Good job!"
        return label
    }()
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.11, green: 0.13, blue: 0.21, alpha: 1.00)
        setupLayout()
        caculateBMI()
    }
    func roundTheNumber(_ value: Float, _ places: Int) -> Float {
        let divisor = powf(10.0, Float(places))
        return round(value * divisor) / divisor
    }
    func caculateBMI(){
        bmiTotal = roundTheNumber(bmiTotal, 1)
        resultNumber.text = String(bmiTotal)
        if bmiTotal <= 18.5{
            resultLabel.text = "THIN"
            statusLabel1.text = "You have a skinny body"
            statusLabel2.text = "Plese improve your diet"
        }
        if bmiTotal > 18.5 && bmiTotal <= 24.9{
            resultLabel.text = "NORMAL"
            statusLabel1.text = "You have a normal body weight"
            statusLabel2.text = "Good job!"
        }
        if bmiTotal > 24.9 && bmiTotal <= 29.9{
            resultLabel.text = "OVERWEIGHT"
            statusLabel1.text = "You have a litte fat body"
            statusLabel2.text = "Go to gym!"
        }
        if bmiTotal > 29.9 && bmiTotal <= 34.9{
            resultLabel.text = "FAT LEVEL 1"
            statusLabel1.text = "You have a fat body in level 1"
            statusLabel2.text = "Eat more vegetable to reduce your weight"
        }
        if bmiTotal > 34.9 && bmiTotal <= 39.9{
            resultLabel.text = "FAT LEVEL 2"
            statusLabel1.text = "You have a fat body in level 2"
            statusLabel2.text = "Please reduce your meal to be more healthy"
        }
        if bmiTotal > 39.9{
            resultLabel.text = "FAT LEVEL 3"
            statusLabel1.text = "You have a fat body in level 3"
            statusLabel2.text = "Please go to the nutrition expert to reduce your weight"
        }
    }
    
    func setupLayout(){
        button.backgroundColor = UIColor(red: 0.91, green: 0.24, blue: 0.40, alpha: 1.00)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.titleLabel?.textColor = UIColor.white
        button.setTitle("RE-CALCULATE", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        
        view.addSubview(mainFrame)
        mainFrame.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        mainFrame.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        mainFrame.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        mainFrame.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        
        view.addSubview(topLabel)
        topLabel.leadingAnchor.constraint(equalTo: mainFrame.leadingAnchor, constant: 0).isActive = true
        topLabel.bottomAnchor.constraint(equalTo: mainFrame.topAnchor, constant: -20).isActive = true
        
        //Re-caculate Button
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        mainFrame.addSubview(resultNumber)
        resultNumber.centerXAnchor.constraint(equalTo: mainFrame.centerXAnchor, constant: 0).isActive = true
        resultNumber.centerYAnchor.constraint(equalTo: mainFrame.centerYAnchor, constant: 0).isActive = true
        
        mainFrame.addSubview(resultLabel)
        resultLabel.centerXAnchor.constraint(equalTo: mainFrame.centerXAnchor, constant: 0).isActive = true
        resultLabel.bottomAnchor.constraint(equalTo: resultNumber.topAnchor, constant: -60).isActive = true
        
        mainFrame.addSubview(statusLabel1)
        statusLabel1.centerXAnchor.constraint(equalTo: mainFrame.centerXAnchor, constant: 0).isActive = true
        statusLabel1.topAnchor.constraint(equalTo: resultNumber.bottomAnchor, constant: 60).isActive = true
        
        mainFrame.addSubview(statusLabel2)
        statusLabel2.centerXAnchor.constraint(equalTo: mainFrame.centerXAnchor, constant: 0).isActive = true
        statusLabel2.topAnchor.constraint(equalTo: statusLabel1.bottomAnchor, constant: 15).isActive = true
        statusLabel2.widthAnchor.constraint(equalTo: mainFrame.widthAnchor, multiplier: 0.8).isActive = true
    }
    @IBAction func onPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
