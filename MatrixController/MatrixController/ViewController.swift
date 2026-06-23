//
//  ViewController.swift
//  MatrixController
//
//  Created by Naga Rajitha Bhogadi on 6/5/26.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createLabelsWithConstraints()
    }
    func createLabelsWithConstraints() {
        var labels: [UILabel] = []
        for _ in 1...9 {
            let label = UILabel()
            label.text = "Swift-UI"
            label.textColor = .systemPink
            label.font = UIFont.boldSystemFont(ofSize: 26)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
            labels.append(label)
        }
        let safe = view.safeAreaLayoutGuide

        let topY: CGFloat = 90
        //let middleY: CGFloat = 360
        //let bottomY: CGFloat = 630
        let leftX: CGFloat = 35
        let centerX: CGFloat = 0
        let rightX: CGFloat = -35
        let topspace: CGFloat = 120
        let verticalGap : CGFloat = 120

        for label in labels {
            NSLayoutConstraint.activate([
                label.widthAnchor.constraint(equalToConstant: 120),
                label.heightAnchor.constraint(equalToConstant: 40)
            ])
        }

        NSLayoutConstraint.activate([
            // First Row
            labels[0].topAnchor.constraint(equalTo: safe.topAnchor, constant: topY),
            labels[0].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftX),

            labels[1].topAnchor.constraint(equalTo: labels[0].topAnchor),
            labels[1].centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerX),

            labels[2].topAnchor.constraint(equalTo: labels[0].topAnchor),
            labels[2].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: rightX),

            // Second Row
            labels[3].centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labels[3].leadingAnchor.constraint(equalTo: labels[0].leadingAnchor),

            labels[4].centerYAnchor.constraint(equalTo: labels[3].centerYAnchor),
            labels[4].centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labels[5].centerYAnchor.constraint(equalTo: labels[3].centerYAnchor),
            labels[5].trailingAnchor.constraint(equalTo: labels[2].trailingAnchor),

            // Third Row
            labels[6].bottomAnchor.constraint(equalTo: safe.bottomAnchor, constant: -90),
            labels[6].leadingAnchor.constraint(equalTo: labels[0].leadingAnchor),

            labels[7].bottomAnchor.constraint(equalTo: labels[6].bottomAnchor),
            labels[7].centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labels[8].bottomAnchor.constraint(equalTo: labels[6].bottomAnchor),
            labels[8].trailingAnchor.constraint(equalTo: labels[2].trailingAnchor)
        ])
    }
}

