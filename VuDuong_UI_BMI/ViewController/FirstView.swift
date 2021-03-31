//
//  FirstView.swift
//  VuDuong_UI_BMI
//
//  Created by Vũ Dương on 29/03/2021.
//

import UIKit

class FirstView: UIViewController {
    
    @IBOutlet weak var caculateButton: UIButton!
    var weight : Int = 50
    var age : Int = 20
    var height : Float = 150.0
    var state = true
    var bmi : Float = 0.0
    let topLabel : CustomHighLabel = {
        let topHighlabel = CustomHighLabel()
        topHighlabel.text = "BMI CACULATOR"
        topHighlabel.font = UIFont.boldSystemFont(ofSize: 25)
        return topHighlabel
    }()
    let line : UIView = {
        let line1 = UIView()
        line1.translatesAutoresizingMaskIntoConstraints = false
        line1.backgroundColor = UIColor(red: 0.09, green: 0.10, blue: 0.18, alpha: 1.00)
        return line1
    }()
    let maleLalbel : CustomLabel = {
        return CustomLabel()
    }()
    //Main Frame
    let maleButton : CustomGenderButton = {
        return CustomGenderButton()
    }()
    let femaleButton : CustomGenderButton = {
        return CustomGenderButton()
    }()
    let heightFrame : CustomFrame = {
        return CustomFrame()
    }()
    let frame3 : CustomFrame = {
        return CustomFrame()
    }()
    let frame4 : CustomFrame = {
        return CustomFrame()
    }()
    //Gender button
    let maleLabel : CustomLabel = {
        let label = CustomLabel()
        label.text = "MALE"
        return label
    }()
    let femaleLabel : CustomLabel = {
        let label = CustomLabel()
        label.text = "FEMALE"
        return label
    }()
    let maleImage : UIImageView = {
        let male = UIImageView()
        male.translatesAutoresizingMaskIntoConstraints = false
        male.contentMode = .scaleAspectFit
        male.clipsToBounds = true
        male.image = UIImage(named: "male")
        return male
    }()
    let femaleImage : UIImageView = {
        let male = UIImageView()
        male.translatesAutoresizingMaskIntoConstraints = false
        male.contentMode = .scaleAspectFit
        male.clipsToBounds = true
        male.image = UIImage(named: "female")
        return male
    }()
    //Height Frame
    let heightLabel : CustomLabel = {
        let label = CustomLabel()
        label.text = "HEIGHT"
        return label
    }()
    let slideBar : UISlider = {
        let slide = UISlider()
        slide.translatesAutoresizingMaskIntoConstraints = false
        slide.minimumTrackTintColor = UIColor(red: 0.60, green: 0.35, blue: 0.44, alpha: 1.00)
        slide.maximumTrackTintColor = UIColor.black
        slide.frame = CGRect(x: 0, y: 0, width: 30, height: 10)
        slide.value = 50
        slide.minimumValue = 0
        slide.maximumValue = 250
        slide.value = 150
        return slide
    }()
    let heightNumber : CustomHighLabel = {
        let number = CustomHighLabel()
        number.font = UIFont.boldSystemFont(ofSize: 40)
        number.text = "150"
        return number
    }()
    let cmLabel : CustomLabel = {
        let cm = CustomLabel()
        cm.text = "cm"
        cm.font = UIFont.boldSystemFont(ofSize: 20)
        return cm
    }()
    let heightStack : UIStackView = {
        let stack1 = UIStackView()
        stack1.translatesAutoresizingMaskIntoConstraints = false
        stack1.axis = .horizontal
        stack1.distribution = .fillEqually
        return stack1
    }()
    //Frame 3
    let weightLabel : CustomLabel = {
        let label = CustomLabel()
        label.text = "WEIGHT"
        return label
    }()
    let frame3plus : CustomPlusButton = {
        let plus = CustomPlusButton()
        return plus
    }()
    let weightNumber : CustomHighLabel = {
        let number = CustomHighLabel()
        number.text = "50"
        number.font = UIFont.boldSystemFont(ofSize: 40)
        return number
    }()
    let plusButton : CustomPlusButton = {
        return CustomPlusButton()
    }()
    let plusButton2 : CustomPlusButton = {
        return CustomPlusButton()
    }()
    //Frame 4
    let ageLabel : CustomLabel = {
        let label  = CustomLabel()
        label.text = "AGE"
        return label
    }()
    let ageNumber : CustomHighLabel = {
        let number = CustomHighLabel()
        number.text = "20"
        number.font = UIFont.boldSystemFont(ofSize: 40)
        return number
    }()
    
    let minusButton : CustomMinusButton = {
        return CustomMinusButton()
    }()
    let minusButton2 : CustomMinusButton = {
        return CustomMinusButton()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.11, green: 0.13, blue: 0.21, alpha: 1.00)
        caculateButton.backgroundColor = UIColor(red: 0.91, green: 0.24, blue: 0.40, alpha: 1.00)
        caculateButton.translatesAutoresizingMaskIntoConstraints = false
        caculateButton.layer.cornerRadius = 5
        caculateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        caculateButton.titleLabel?.textColor = UIColor.white
        caculateButton.setTitle("CALCULATE", for: .normal)
        caculateButton.setTitleColor(UIColor.white, for: .normal)
        setupLayout()
        maleButton.addTarget(self, action: #selector(maleSelected), for: .touchUpInside)
        femaleButton.addTarget(self, action: #selector(femaleSelected), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(weightPlus), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(weightMinus), for: .touchUpInside)
        plusButton2.addTarget(self, action: #selector(agePlus), for: .touchUpInside)
        minusButton2.addTarget(self, action: #selector(ageMinus), for: .touchUpInside)
        slideBar.addTarget(self, action: #selector(slide), for: .valueChanged)
    }
    @objc func maleSelected(){
        if state {
            maleButton.backgroundColor = UIColor(red: 0.16, green: 0.16, blue: 0.18, alpha: 1.00)}
        else {
            maleButton.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.26, alpha: 1.00)
        }
        state = !state
    }
    @objc func femaleSelected(){
        if state {
            femaleButton.backgroundColor = UIColor(red: 0.16, green: 0.16, blue: 0.18, alpha: 1.00)}
        else {
            femaleButton.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.26, alpha: 1.00)
        }
        state = !state
    }
    @objc func weightPlus(){
        weight += 1
        weightNumber.text = String(weight)
    }
    @objc func weightMinus(){
        weight -= 1
        weightNumber.text = String(weight)
    }
    @objc func agePlus(){
        age += 1
        ageNumber.text = String(age)
    }
    @objc func ageMinus(){
        age -= 1
        ageNumber.text = String(age)
    }
    @objc func slide(){
        height = roundTheNumber(slideBar.value, 1)
        heightNumber.text = String(height)
    }
    func roundTheNumber(_ value: Float, _ places: Int) -> Float {
        let divisor = powf(10.0, Float(places))
        return round(value * divisor) / divisor
    }
    func setupLayout(){
        //Config BMI Text
        view.addSubview(topLabel)
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        view.addSubview(line)
        line.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20).isActive = true
        line.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        line.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        line.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.01).isActive = true
        
        //Config Main Layout
        view.addSubview(heightFrame)
        heightFrame.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        heightFrame.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -5).isActive = true
        heightFrame.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        heightFrame.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
        view.addSubview(maleButton)
        maleButton.heightAnchor.constraint(equalTo: heightFrame.heightAnchor, multiplier: 1.15).isActive = true
        maleButton.bottomAnchor.constraint(equalTo: heightFrame.topAnchor, constant: -20).isActive = true
        maleButton.widthAnchor.constraint(equalTo: heightFrame.widthAnchor, multiplier: 0.47).isActive = true
        maleButton.leadingAnchor.constraint(equalTo: heightFrame.leadingAnchor, constant: 0).isActive = true
        
        view.addSubview(femaleButton)
        femaleButton.heightAnchor.constraint(equalTo: heightFrame.heightAnchor, multiplier: 1.15).isActive = true
        femaleButton.bottomAnchor.constraint(equalTo: heightFrame.topAnchor, constant: -20).isActive = true
        femaleButton.widthAnchor.constraint(equalTo: heightFrame.widthAnchor, multiplier: 0.47).isActive = true
        femaleButton.trailingAnchor.constraint(equalTo: heightFrame.trailingAnchor, constant: 0).isActive = true
        
        view.addSubview(frame3)
        frame3.topAnchor.constraint(equalTo: heightFrame.bottomAnchor, constant: 20).isActive = true
        frame3.leadingAnchor.constraint(equalTo: maleButton.leadingAnchor, constant: 0).isActive = true
        frame3.trailingAnchor.constraint(equalTo: maleButton.trailingAnchor, constant: 0).isActive = true
        frame3.heightAnchor.constraint(equalTo: maleButton.heightAnchor, multiplier: 1).isActive = true
        
        view.addSubview(frame4)
        frame4.topAnchor.constraint(equalTo: heightFrame.bottomAnchor, constant: 20).isActive = true
        frame4.leadingAnchor.constraint(equalTo: femaleButton.leadingAnchor, constant: 0).isActive = true
        frame4.trailingAnchor.constraint(equalTo: femaleButton.trailingAnchor, constant: 0).isActive = true
        frame4.heightAnchor.constraint(equalTo: femaleButton.heightAnchor, multiplier: 1).isActive = true
        
        //Config Male Button
        maleButton.addSubview(maleImage)
        maleImage.centerXAnchor.constraint(equalTo: maleButton.centerXAnchor, constant: 0).isActive = true
        maleImage.topAnchor.constraint(equalTo: maleButton.topAnchor, constant: 50).isActive = true
        maleImage.widthAnchor.constraint(equalTo: maleButton.widthAnchor, multiplier: 0.7).isActive = true
        maleImage.heightAnchor.constraint(equalTo: maleButton.heightAnchor, multiplier: 0.4).isActive = true
        
        maleButton.addSubview(maleLabel)
        maleLabel.centerXAnchor.constraint(equalTo: maleButton.centerXAnchor, constant: 0).isActive = true
        maleLabel.topAnchor.constraint(equalTo: maleImage.bottomAnchor, constant: 10).isActive = true
        
        //Config Female Button
        femaleButton.addSubview(femaleImage)
        femaleImage.centerXAnchor.constraint(equalTo: femaleButton.centerXAnchor, constant: 0).isActive = true
        femaleImage.topAnchor.constraint(equalTo: femaleButton.topAnchor, constant: 50).isActive = true
        femaleImage.widthAnchor.constraint(equalTo: femaleButton.widthAnchor, multiplier: 0.7).isActive = true
        femaleImage.heightAnchor.constraint(equalTo: femaleButton.heightAnchor, multiplier: 0.4).isActive = true
        
        femaleButton.addSubview(femaleLabel)
        femaleLabel.centerXAnchor.constraint(equalTo: femaleButton.centerXAnchor, constant: 0).isActive = true
        femaleLabel.topAnchor.constraint(equalTo: femaleImage.bottomAnchor, constant: 10).isActive = true
        
        //Config Height Frame
        heightFrame.addSubview(heightLabel)
        heightLabel.centerXAnchor.constraint(equalTo: heightFrame.centerXAnchor, constant: 0).isActive = true
        heightLabel.topAnchor.constraint(equalTo: heightFrame.topAnchor, constant: 10).isActive = true
        
        heightFrame.addSubview(heightNumber)
        heightNumber.centerXAnchor.constraint(equalTo: heightFrame.centerXAnchor, constant: 0).isActive = true
        heightNumber.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10).isActive = true
        
        heightFrame.addSubview(cmLabel)
        cmLabel.leadingAnchor.constraint(equalTo: heightNumber.trailingAnchor, constant: 0).isActive = true
        cmLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 28.5).isActive = true
        
        heightFrame.addSubview(slideBar)
        slideBar.centerXAnchor.constraint(equalTo: heightFrame.centerXAnchor, constant: 0).isActive = true
        slideBar.topAnchor.constraint(equalTo: heightNumber.bottomAnchor, constant: 10).isActive = true
        slideBar.widthAnchor.constraint(equalTo: heightFrame.widthAnchor, multiplier: 0.8).isActive = true
        slideBar.heightAnchor.constraint(equalTo: heightFrame.heightAnchor, multiplier: 0.2).isActive = true
        
        //Weight Frame
        frame3.addSubview(weightLabel)
        weightLabel.centerXAnchor.constraint(equalTo: frame3.centerXAnchor, constant: 0).isActive = true
        weightLabel.topAnchor.constraint(equalTo: frame3.topAnchor, constant: 50).isActive = true
        
        frame3.addSubview(weightNumber)
        weightNumber.centerXAnchor.constraint(equalTo: frame3.centerXAnchor, constant: 0).isActive = true
        weightNumber.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10).isActive = true
        
        frame3.addSubview(plusButton)
        plusButton.topAnchor.constraint(equalTo: weightNumber.bottomAnchor, constant: 10).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: frame3.trailingAnchor, constant: -40).isActive = true
        plusButton.widthAnchor.constraint(equalTo: frame3.widthAnchor, multiplier: 0.2).isActive = true
        plusButton.heightAnchor.constraint(equalTo: frame3.heightAnchor, multiplier: 0.2).isActive = true
        
        frame3.addSubview(minusButton)
        minusButton.topAnchor.constraint(equalTo: weightNumber.bottomAnchor, constant: 10).isActive = true
        minusButton.leadingAnchor.constraint(equalTo: frame3.leadingAnchor, constant: 40).isActive = true
        minusButton.widthAnchor.constraint(equalTo: frame3.widthAnchor, multiplier: 0.2).isActive = true
        minusButton.heightAnchor.constraint(equalTo: frame3.heightAnchor, multiplier: 0.2).isActive = true
        
        //Frame 4
        frame4.addSubview(ageLabel)
        ageLabel.centerXAnchor.constraint(equalTo: frame4.centerXAnchor, constant: 0).isActive = true
        ageLabel.topAnchor.constraint(equalTo: frame4.topAnchor, constant: 50).isActive = true
        
        frame4.addSubview(ageNumber)
        ageNumber.centerXAnchor.constraint(equalTo: frame4.centerXAnchor, constant: 0).isActive = true
        ageNumber.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10).isActive = true
        
        frame4.addSubview(plusButton2)
        plusButton2.topAnchor.constraint(equalTo: ageNumber.bottomAnchor, constant: 10).isActive = true
        plusButton2.trailingAnchor.constraint(equalTo: frame4.trailingAnchor, constant: -40).isActive = true
        plusButton2.widthAnchor.constraint(equalTo: frame4.widthAnchor, multiplier: 0.2).isActive = true
        plusButton2.heightAnchor.constraint(equalTo: frame4.heightAnchor, multiplier: 0.2).isActive = true
        
        frame4.addSubview(minusButton2)
        minusButton2.topAnchor.constraint(equalTo: ageNumber.bottomAnchor, constant: 10).isActive = true
        minusButton2.leadingAnchor.constraint(equalTo: frame4.leadingAnchor, constant: 40).isActive = true
        minusButton2.widthAnchor.constraint(equalTo: frame4.widthAnchor, multiplier: 0.2).isActive = true
        minusButton2.heightAnchor.constraint(equalTo: frame4.heightAnchor, multiplier: 0.2).isActive = true
        
        //Caculate Button
        caculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        caculateButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -115).isActive = true
        caculateButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        caculateButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
    }
    
    @IBAction func onPress(_ sender: Any) {
        let secondVC = SecondView()
        bmi = Float(weight)/((height/100)*(height/100))
        secondVC.bmiTotal = bmi
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
    
    
}
