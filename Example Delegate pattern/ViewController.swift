//
//  ViewController.swift
//  Example Delegate pattern
//
//  Created by Frantisek Varadzin on 16.01.22.
//

import UIKit

class ViewController: UIViewController {
    var titleLabel = UILabel()
    var vehicleImage = UIImageView()
    var selectButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configTitle()
        configVehicleImage()
        configButton()
    }
    
    func configTitle() {
        view.addSubview(titleLabel)
        titleLabel.text = "What will you drive today?"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.textColor = .systemGreen
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    func configVehicleImage() {
        view.addSubview(vehicleImage)
        vehicleImage.layer.cornerRadius = 10
        vehicleImage.clipsToBounds = true
        vehicleImage.image = UIImage(named: "car")
        
        vehicleImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vehicleImage.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 50),
            vehicleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vehicleImage.heightAnchor.constraint(equalToConstant: 300),
            vehicleImage.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    func configButton() {
        view.addSubview(selectButton)
        selectButton.layer.cornerRadius = 15
        selectButton.backgroundColor = .systemGreen
        selectButton.setTitle("Choose your car", for: .normal)
        selectButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            selectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectButton.heightAnchor.constraint(equalToConstant: 50),
            selectButton.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    @objc func didTapButton() {
        let destinationViewControler = SelectView()
        let navigationController = UINavigationController(rootViewController: destinationViewControler)
        present(navigationController, animated: true)
    }
}

extension ViewController: CarSelectDelegate {
    func didSelectCar(image: UIImage, name: String) {
        titleLabel.text = "You chosed \(name) for today"
        vehicleImage.image = image
    }
}
