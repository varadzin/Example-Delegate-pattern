//
//  SelectView.swift
//  Example Delegate pattern
//
//  Created by Frantisek Varadzin on 16.01.22.
//

import UIKit

protocol CarSelectDelegate {
    func didSelectCar(image: UIImage, name: String)
}
class SelectView: UIViewController {
    var selectionDelegate: CarSelectDelegate!
    var logoAudiButton = UIButton()
    var logoBugattiButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configAudiButton()
        configBugattiButton()
    }
    func configAudiButton() {
        view.addSubview(logoAudiButton)
        logoAudiButton.setImage(UIImage(named: "logoAudi"), for: .normal)
        logoAudiButton.layer.cornerRadius = 8
        logoAudiButton.clipsToBounds = true
        logoAudiButton.layer.borderWidth = 0.5
        logoAudiButton.layer.borderColor = UIColor.systemGray4.cgColor
        logoAudiButton.addTarget(self, action: #selector(didTapAudiButton), for: .touchUpInside)
        
        logoAudiButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoAudiButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            logoAudiButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoAudiButton.heightAnchor.constraint(equalToConstant: 100),
            logoAudiButton.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    @objc func didTapAudiButton() {
        selectionDelegate.didSelectCar(image: UIImage(named: "audi")!, name: "Audi")
        dismiss(animated: true, completion: nil)
    }
    func configBugattiButton() {
        view.addSubview(logoBugattiButton)
        logoBugattiButton.setImage(UIImage(named: "logoBugatti"), for: .normal)
        logoBugattiButton.layer.cornerRadius = 8
        logoBugattiButton.clipsToBounds = true
        logoBugattiButton.layer.borderWidth = 0.5
        logoBugattiButton.layer.borderColor = UIColor.systemGray4.cgColor
        logoBugattiButton.addTarget(self, action: #selector(didTapBugattiButton), for: .touchUpInside)
        
        logoBugattiButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoBugattiButton.topAnchor.constraint(equalTo: logoAudiButton.bottomAnchor, constant: 50),
            logoBugattiButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoBugattiButton.heightAnchor.constraint(equalToConstant: 100),
            logoBugattiButton.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    @objc func didTapBugattiButton() {
        selectionDelegate.didSelectCar(image: UIImage(named: "bugatti")!, name: "Bugatti")
        dismiss(animated: true, completion: nil)
    }
}
