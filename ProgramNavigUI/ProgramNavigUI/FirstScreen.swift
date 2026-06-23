//
//  ViewController.swift
//  ProgramNavigUI
//
//  Created by Naga Rajitha Bhogadi on 6/4/26.
//

import UIKit

class FirstScreen: UIViewController {
    
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        view.backgroundColor = .systemBackground
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setUpButton() {
        view.addSubview(nextButton)
        
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemPink
        nextButton .configuration?.title = "Next"
        nextButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    @objc func nextScreen () {
        let nextScreen = SecondScreen()
        nextScreen.title = "SecondScreen"
        self.navigationItem.backButtonTitle = "First Screen"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}

